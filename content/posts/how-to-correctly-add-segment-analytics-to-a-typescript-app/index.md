---
title: How to Correctly Add Segment Analytics to a Typescript App
date: 2022-11-02T08:51:47.090Z
draft: false
categories:
  - programming
tags:
  - frontend
  - javascript
---
I was tasked with adding [Segment](https://segment.com), an analytics pipeline API thing that plugs into tools like Google Analytics, to a client's app.


The [docs](https://segment.com/docs/connections/sources/catalog/libraries/website/javascript/quickstart/) are decent, but they specifically [recommend](https://segment.com/docs/segment-app/set-up-envs/) keeping prod and dev environments in the same workspace, and make these things "different sources." 

"Sources" in Segment are determined, for their [Javascript API](https://segment.com/docs/connections/sources/catalog/libraries/website/javascript/quickstart/)}, by a "write key." Obviously I would thus like to include this "write key" in environment variables so I can just swap them out for the dev environment and on the deploy server, the standard way to manage API keys and the like. However, their "recommended method" for installing the segment tooling is a big blob of javascript that you're just expected to stick in your `index.html`

Now everyone's buld environment is different, and perhaps it's straightforward in some cases to have an index.html go through the webpack build process in a way that gives it access to environment variables, pass them in to the snippet that way, fine, but I'd much rather manage this all in the app context itself, which in this case is a react / redux app. Then I can even have my own error handling and whatnot. 

The app is a typescript app, however, which means I need to handle the Segment API being attached to `window` in a way that typescript is happy with, which means including Segment types and getting that snippet in the code someway. 

At first I just tried to copy the code into a file that I'd import, tweaking it to make it happy with the linter or whatever, and grabbing the types from [a package output from DefinitelyTyped](https://www.npmjs.com/package/@types/segment-analytics) that I found, but that caused funky weird typescript errors that were truly stupid to parse like "the type is referred to directly or indirectly in its own type annotation?" Does that actually make sense to people and I'm just an idiot? Well fine if so, I'd rather be an idiot than have whatever information necessary to make that error make sense be in my brain.

Anyway eventually I found [this semi-useful medium article](https://javascript.plainenglish.io/add-segment-google-analytics-to-your-typescript-next-js-app-af9fc7cd83a9) that pointed me to the fact that Segment, telling nobody, actually has a [sneaky little library](https://www.npmjs.com/package/@segment/snippet) you can import to 