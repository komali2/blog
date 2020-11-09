---
title: "highlights-getter"
date: 2020-11-08T02:16:47-08:00
draft: false
categories: ['programming']
tags: ['personal-project', 'open-source', 'javascript', 'web' ]
---

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
https://read.amazon.com/kp/notebook . First, that site doesn't really work in firefox. Second,
it appears to have been built by readwise, and sometimes redirects to readwise's site. I'm
really curious what the relationship is there between readwise and Amazon. For example,
read.amazon.com is just the kindle web reader.

Anyway, first thought, I'm trying to get some python apps on my github, maybe I can
do some wild ass python app that authenticates and then navigates the webapp? Tossed that idea
out pretty quickly, the Amazon site has some gnarly javascript I'd have to sort out, no thanks.
So second choice is simply a [bookmarklet](https://en.wikipedia.org/wiki/Bookmarklet).
I'd never made one but I heard they were easy. I
looked up just enough to know that basically, if it worked in the inspection tools console,
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
  // virtualDocument is used instead of document for reasons that'll be clear later
  virtualDocument.querySelectorAll('#highlight').forEach((el) => {
    const metadata = el.closest('.a-spacing-base').querySelector('#annotationNoteHeader').innerText;
    const highlightText = el.innerText;
    const title = virtualDocument.querySelector('h3.kp-notebook-metadata').textContent;
    const author = virtualDocument.querySelector('p.kp-notebook-metadata.a-spacing-none').textContent;
    highlights.push({ metadata, highlightText, title, author });
  });
};
{{< / highlight >}}
