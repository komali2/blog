---
title: "API World Hackathon"
date: 2016-09-16T20:16:47-08:00
draft: false
categories: ['programming']
tags: ['personal-project', 'open-source', 'hackathon']
---

This weekend I attended the API World Hackathon with Alex, Ben, and Matt. Other than Ben, this was all of our's first Hackathon. We're all Hack Reactor / Makersquare graduates as well, so it was a sort of return to a very familiar environment - fluorescent lights, harried group, and 11pm pull requests.

Got to work with a ton of cool APIs. There was some stuff out of my range of understanding - for example, <a href="http://www.netapp.com">Netapp</a> was featuring some sort of distributed cloud VM service that I simply could not grock. I had made the mistake of asking for details at their table and had to quickly jump into polite-nodding mode. <a href="http://apiworld.co/hackathon/#sponsors">Some of the other sponsors</a> had more approachable APIs, such as <a href="https://www.traitify.com/">Traitify</a>, which was promoting a "personality analyser." It's a fairly cool concept - swipe some picture-based questions and it spits out "you are an action-taker!" or something, although we couldn't think of a large variety of use cases. Another that I thought was <em>awesome</em> was <a href="https://dev.havenondemand.com">Haven's</a> unbelievable list of APIs - <a href="https://dev.havenondemand.com/apis">check of of these</a> out! One endpoint takes in a video stream and spits out license plates it detected, another can take in a massive string and do sentiment analysis, another can index documents, etc. Some of this stuff is on par with what <a href="https://googlecloudplatform.github.io/google-cloud-node/#/docs/google-cloud/0.40.0/google-cloud">Google Cloud</a> or <a href="http://www.ibm.com/watson/explorer.html">IMB Watson</a> are doing.

We spent the majority of the morning attending talks and planning an idea. Since we were all bootcamp grads, we were no strangers to putting together an idea quickly and cooperatively. I think we may have been one of the first groups (that didn't come in with an app idea) to start working on the app itself. There were groups that around 6pm hadn't even settled on an idea or started coding. A couple ideas we spitballed - using the <a href="https://dev.havenondemand.com/apis/recognizelicenseplates#overview">Haven License Plate detector </a>combined with their <a href="https://dev.havenondemand.com/apis/anomalydetection#overview">Anomaly Detection API</a> to somehow build a security management system, which we had to toss when we couldn't find any good video streams we could pull plates from.

We ended up making a "reputation aggregator." Lacking better names, we called ourselves <a href="https://github.com/WorldAPIGroup16/TheCore">The Core</a> and got to work. The idea was we'd generate 3 key indicators for reputation - workforce personality, marketplace reputation, and social media positivity, and turn those into a "Core Score" (I know). A person could link to their profile page to, say, demonstrate that their new Ebay account is trustworthy because they have a high Amazon score, or that a company should hire them because they are type ___ personality and have a high social media positivity.

A couple things we did wrong - we decided to use React, which probably wasn't necessary for an MVP. I spent a long time wrastling with untying Webpack Dev Server middleware from my Node backend, and finally managed to throw the whole thing out and just have it included as a Webpack plugin. I eventually gave up on React altogether and focused on the backend, which is great because that's where all the meat and potatoes was going down anyway.

The problem - we had to structure our data such that:
<ol>
 	<li>Core Score
<ol>
 	<li>Market Score
<ol>
 	<li>Ebay</li>
 	<li>Amazon</li>
 	<li>Etsy</li>
</ol>
</li>
 	<li>Social Score
<ol>
 	<li>Reddit</li>
 	<li>Twitter</li>
 	<li>Facebook</li>
</ol>
</li>
 	<li>Personality
<ol>
 	<li>Traitify API</li>
 	<li>Something else potentially</li>
</ol>
</li>
</ol>
</li>
</ol>
We didn't want a GET for a user's "Core Score" to force all the other scores to force-update potentially, so we needed a way to only be triggering "updates" to a score occassionally. The reason is an update required:
<ol>
 	<li>Querying the DB for a user's login for the given API (facebook, whatever)</li>
 	<li>Querying Facebook for their posts (or etsy for their score, etc)</li>
 	<li>Sending that data to another API or running calculations on it</li>
 	<li>Saving that to the database</li>
 	<li>Sending the updated data to the client</li>
</ol>
Imagine if we wanted to do that for the entire Market score, though. We'd potentially be running all those asynchronous calls on every market, then recalculating the Market score off it. Yuck. So I presented the idea of "gears." Basically, all the little score that required external API calls to grab were little gears and should be updated fairly regularly, whereas the "higher up" you go, the more work is required to update, so those should be seen as "larger gears" and "turn" more slowly. The end result was, say if we wanted to update the Market Score:
<ol>
 	<li>Query the DB for a user's Ebay, Amazon, and Etsy score</li>
 	<li>Calculate the Market Score</li>
 	<li>Save the new Market Score to the database</li>
</ol>
The only time external API calls would be made is when we need to update one of the "smaller" scores. Otherwise, we just do DB queries, which are relatively fast. Furthermore, this will all happen on scheduled timers, not based off a client request, so all a client needs to do is to a DB query and grab all the values, rather than wait for calculations and external APIs.

So, with that in mind, I went about structuring the app. I set up "controllers" for each API, and each controller would return a promise that could be .then'd off of. For example, the <a href="https://github.com/komali2/TheCore/blob/master/server/controllers/social/controllers/twitterController.js">Twitter controller</a>.

<hr />

In the end, we didn't manage to get the app running as much as we'd like, though the back end was chaining and updating the database successfully for at least one external API per score. Some of the other apps that did get working prototypes up and running were pretty cool - one group had a mobile app that used the camera to overlay a big green checkmark or red X over the screen depending whether you were looking at food you were allergic to or not. The prizes were impressive - things like 10,000$ in Visa gift cards, huge enterprise equipment, etc.

For some reason nobody but me tried out the Cisco API, so I ended up walking home with this <a href="https://www.amazon.com/Cisco-Meraki-Dual-Band-Performance-Enterprise/dp/B00QSNIK8C">800$ Cisco router</a> I'm still not sure what to do with.