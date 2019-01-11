---
title: "Marionette 2.4.4 Gotcha: Changing a Filter's View"
date: 2017-04-11T00:16:47-08:00
draft: false
categories: ['programming']
tags: ['marionette']
---

I was banging my head against the desk trying to figure out why the following code, <em>straight from the Marionette.js docs</em>, wasn't working:

&nbsp;
<pre>var cv = new Marionette.CollectionView({
 childView: SomeChildView,
 emptyView: SomeEmptyView,
 collection: new Backbone.Collection([
   { value: 1 },
   { value: 2 },
   { value: 3 },
   { value: 4 }
 ]),

// Only show views with even values
 filter: function (child, index, collection) {
     return child.get('value') % 2 === 0;
   }
 });

// renders the views with values '2' and '4'
 cv.render();

// change the filter
 cv.filter = function (child, index, collection) {
   return child.get('value') % 2 !== 0;
 };

// renders the views with values '1' and '3'
 cv.render();</pre>
In short, you instantiate a view, and in that instantiation, define a filter function. Then later on, you just change the view.filter, rerender, and boom! New filtered view. Right? No.

No matter what, my view simply didn't reflect my new filter. At one point I set it to a function that simply returned false, and still stuff showed up! So then I entered a frustrated console.log to print "WTF!!" to the console whenever my original filter function was invoked. Weirdly, I noticed that it was always invoked, on every render, even if I "changed" my filter function.

So, I stepped into the debugger, and saw that where I was changing the filter, the view.filter didn't even exist! It was undefined! What black magic madness is that?!

So, onwards to the Marionette source code. I stepped through, clicking idly, and noticed that view.render invokes Marionette.getOption. Looking at that:
<pre>

// Marionette.getOption
// --------------------

// Retrieve an object, function or other value from a target
// object or its `options`, with `options` taking precedence.
Marionette.getOption = function(target, optionName) {
 if (!target || !optionName) { return; }
 if (target.options &amp;&amp; (target.options[optionName] !== undefined)) {
   return target.options[optionName];
 } else {
   return target[optionName];
 }
};</pre>
So basically, the render function first checks for a filter in the view.options, which is where filters that are added during instantiation get stuck. If there's no filter there, <em>only then </em>does it invoke whatever filter is attached directly on the view.

So, the example in the docs should actually be:
<pre>// change the filter
 cv.options.filter = function (child, index, collection) {
   return child.get('value') % 2 !== 0;
 };</pre>
Luckily for those that aren't stuck in the stone age, newer Marionette versions have  a setFilter() function available on views, so the above is irrelevant. We'll upgrade some day.... some day....