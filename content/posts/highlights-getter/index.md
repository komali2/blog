---
title: "highlights-getter"
date: 2020-11-08T02:16:47-08:00
draft: false
categories: ['programming']
tags: ['personal-project', 'open-source', 'javascript', 'frontend' ]
---

If you're just here to grab some code or use the bookmarklet,
these links should help:

* [Unminified Code]({{< relref "#the-completed-code" >}})
* [Oneline Copy/Paste Bookmarklet](https://raw.githubusercontent.com/komali2/highlights-getter/v0.2/highlights-getter.min.js)
* [README Instructions for Using the Bookmarklet](https://github.com/komali2/highlights-getter/blob/v0.2/README.md)

Had a crisis of impostor syndrome, wanted to bang out a quick project to see if I actually
enjoy programming in my free time. Sat at my desk for a while, clicking through my
google keep notes tagged with "app-ideas," lots of stuff about playing with random free
data sources I've found over the years, or APIs, that sort of thing. Didn't really have
the energy to be playing like that, but then remembered that I'd been meaning to find a way
to get my kindle highlights in, like, JSON or something, to play with.

For a little bit I was using the [readwise](https://readwise.io/) service for playing around
with highlights, thought about making an [ANKI](https://apps.ankiweb.net/) flow or something.
But, that costs money, and I'm cutting all expenses in prep for our move to Taiwan.

Ok, so, that shouldn't be hard, just gotta find out some programmatic way to grab them.

So first, what official ways am I allowed to grab them? I could only find one:
https://read.amazon.com/kp/notebook . But, that site doesn't really work in firefox. Also,
it appears to have been built by readwise, and sometimes redirects to readwise's site. I'm
really curious what the relationship is there between readwise and Amazon. For example,
read.amazon.com is just the kindle web reader.

Anyway, first thought, I'm trying to get some python apps on my github, maybe I can
do some wild ass python app that authenticates and then navigates the webapp? Tossed that idea
out pretty quickly, the Amazon site has some gnarly javascript I'd have to sort out, no thanks.
So second choice is simply a [bookmarklet](https://en.wikipedia.org/wiki/Bookmarklet).
I'd never made one but I heard they were easy. I
looked up just enough to know that basically, if my code worked in the inspection tools console,
it'll work in a bookmarklet, so cracked on with that framework.

I wondered if there were XHR requests I could inspect, so first I popped open the network
panel of the inspector tool and clicked on some books to see what came back. Looks like it's
a server-side rendered app, as what comes back from requests is just HTML webpages.

From there I was basically just clicking around in the inspector tool throughout the DOM,
finding the best way to select certain nodes and extract text from them.

First I figured out how to grab what I need from a given page, namely the book title, author,
location where the note was found in the book, and the highlight text itself. All of that
exists in a list of elements that each helpfully (but also terribly) have the id `#highlight`.

{{< highlight javascript  >}}
function scrapePage(virtualDocument) {
  // virtualDocument is used instead of document
  // for reasons that'll be clear later
  virtualDocument.querySelectorAll('#highlight').forEach((el) => {
    const metadata = el.closest('.a-spacing-base')
      .querySelector('#annotationNoteHeader')
      .innerText;

    const highlightText = el.innerText;

    const title = virtualDocument
      .querySelector('h3.kp-notebook-metadata')
      .textContent;

    const author = virtualDocument
      .querySelector('p.kp-notebook-metadata.a-spacing-none')
      .textContent;

    highlights.push({ metadata, highlightText, title, author });
  });
};
{{< / highlight >}}

Now, I needed to figure out how to get each of the pages available. So, with the network
inspector open, I clicked some of the books on the left-side navigation. Luckily,
those links trigger navigations to `read.amazon.com/kp/notebook/{{ASIN}}`, with ASIN
being, I dunno, some kind of unique book identifier? Point is, a very straightforward API,
even though it's returning full HTML pages.

The ASIN for each link also happened to be stored in a data-property, named
`get-annotations-for-asin`, which you can select with `[data-get-annotations-for-asin]`, so
I grab all of the ASINs for all my books with:

{{< highlight javascript >}}
const ASINs = [];

function getAllASIN() {
  document.querySelectorAll('[data-get-annotations-for-asin]')
    .forEach((el) => {
      ASINs.push(JSON.parse(el.dataset.getAnnotationsForAsin).asin);
    });
};
{{< / highlight >}}

Now, I need to request a page for each and every one of my books, via ASIN. Then, I can
scrape those pages with the function from earlier. I'm about to chain together some hella
promises, because the fetch returns a promise, the method to extract text from the fetch
body, and I need to invoke both on every ASIN.


{{< highlight javascript >}}
const BASE_URL = 'https://read.amazon.com/kp/notebook';

// The below uses a javascript template string, which lets you use
// the ${} syntax to use drop-in variables.
function generateASINUrl(ASIN) {
  return `${BASE_URL}?asin=${ASIN}&contentLimitState=&`;
}

// Get the page for a book:
function getResponseForBook(ASIN) {
  return fetch(generateASINUrl(ASIN), { mode: 'no-cors' });
}

// Get the text from the response of that fetch,
// which is an HTML document:
function getPageForResponse(response) {
  return response.text();
}

// Wrapper loop functions for getting responses, and then
// html documents from those responses, for all books
function getResponses() {
  return Promise.all(ASINs.map((ASIN) => {
    return getResponseForBook(ASIN);
  }));
}

function getPages(responses) {
  return Promise.all(responses.map((response) => {
    return getPageForResponse(response);
  }));
}

const pages = await getPages(await getResponses(ASINs));

{{< / highlight >}}

That map inside the `Promise.all` seems kinda confusing, I know. Basically,
I want to invoke a fetch on every single ASIN, so there's going to be a loop.
`Promise.all` lets me stuff a bunch of promises into an array, and then act only
when all of those promises are resolved (or one fails, or, some other rules). So,
I need to get an array of promises. By using `map`, I can do exactly that. In
`getResponses`, I iterate through my list of ASINs, create a promise with `fetch`,
return said promise from `getResponseForBook`, and then return that from the `map`
callback function, plopping it into the array that will be returned from `getResponses`.

That array is then `await`ed, so by the time it's used as an argument to `getPages`, it's
instead an array of fetch responses. Then, a similar process occurs for `getPages`, and
since this function is as well `await`ed, the `pages` variable is set to be an array
of strings representing HTML documents.

So, how do you parse a string that represents an HTML document, so that you can actually
use DOM methods on it like `.closest` or `.querySelector`? Just use
`document.createElement` to create an HTML element, and then set its `innerHTML` to be said
string!

{{< highlight javascript >}}
function createHtmlDocument(htmlString) {
  const htmlElem = document.createElement('html');
  htmlElem.innerHTML = htmlString;
  return htmlElem;
}
{{< / highlight >}}

And again, those get mapped into an array, and then `scrapePage` is called on each.

{{< highlight javascript >}}
const virtualDocuments = pages.map(createHtmlDocument);
virtualDocuments.forEach(scrapePage);
{{< / highlight >}}

After that I simply plop that fat JSON as a string into the user's clipboard.

I also wrap the whole thing in an IIFI (immediately invoked function invocation) because
I guess that's what bookmarklets want, probably to avoid polluting the webpage context
they're executed in with globals - which, every single one of those functions I just wrote
is!

I also minified it into one line for politeness' sake, though on the browsers I tested,
it didn't seem to matter.

# The Completed Code

{{< highlight javascript >}}
(function(){

const highlights = [];
const ASINs = [];

const BASE_URL = 'https://read.amazon.com/kp/notebook';


function generateASINUrl(ASIN) {
  return `${BASE_URL}?asin=${ASIN}&contentLimitState=&`;
}

function scrapePage(virtualDocument) {
  virtualDocument.querySelectorAll('#highlight').forEach((el) => {
    const metadata = el
      .closest('.a-spacing-base')
      .querySelector('#annotationNoteHeader')
      .innerText;
    const highlightText = el.innerText;
    const title = virtualDocument
      .querySelector('h3.kp-notebook-metadata')
      .textContent;
    const author = virtualDocument
      .querySelector('p.kp-notebook-metadata.a-spacing-none')
      .textContent;
    highlights.push({ metadata, highlightText, title, author });
  });
};

function getAllASIN() {
  document.querySelectorAll('[data-get-annotations-for-asin]')
    .forEach((el) => {
      ASINs.push(
        JSON.parse(
          el.dataset.getAnnotationsForAsin).asin);
    ]});
};

function createHtmlDocument(htmlString) {
  const htmlElem = document.createElement('html');
  htmlElem.innerHTML = htmlString;
  return htmlElem;
}

function getResponseForBook(ASIN) {
  return fetch(generateASINUrl(ASIN), { mode: 'no-cors' });
}

function getPageForResponse(response) {
  return response.text();
}

function getResponses() {
  return Promise.all(ASINs.map(async (ASIN) => {
    return getResponseForBook(ASIN);
  }));
}

function getPages(responses) {
  return Promise.all(responses.map(async (response) => {
    return getPageForResponse(response);
  }));
}

function copyToClipboard(str) {
  navigator.clipboard.writeText(str);
}

async function main() {
  getAllASIN();
  const pages = await getPages( await getResponses(ASINs));
  const virtualDocuments = pages.map(createHtmlDocument);
  virtualDocuments.forEach(scrapePage);
  copyToClipboard(JSON.stringify(highlights));
  alert('done! content is in your clipboard.');
}
  main();
})();

{{< / highlight >}}
