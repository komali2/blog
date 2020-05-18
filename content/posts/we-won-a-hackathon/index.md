---
title: "We Won a Hackathon!"
date: 2017-02-21T02:16:47-08:00
draft: false
categories: ['programming']
tags: ['personal-project', 'open-source', 'hackathon']
---

{{< img
    src="IMG_0547-1024x683.jpg"
    alt="The developer week hackathon at Galvanize"
    width="780"
    height="520" >}}

Well, to be fair, we won the <a href="http://accelerate.im/challenges/105">Sensel challenge</a> at the <a href="http://www.developerweek.com/hackathon/">Developer Week Hackathon</a>. Some other jabronis won the whole hackathon. But, still, something to put on the resume :)

We entered the Hackathon with a team of 4: Me, Riley, Rico, and Carolin. During the hackathon we picked up Swen, a fresh transplant from Europe here for a few weeks to experience the coding environment in San Francisco before starting a totally different career in London.


{{< img
    src="IMG_0644-1024x683.jpg"
    alt="Our hackathon team."
    width="780"
    height="520" >}}
    Left to right: Riley, Swen, Carolin, and me

We started out just spitballing ideas and talking to the many sponsors about the tech they were bringing to the table. We had a sort of "fingers in as many pies as possible" strategy going in, figuring we wouldn't beat out top teams for the big prize so instead should target smaller prizes. So we thought we'd combine <a href="http://accelerate.im/challenges/126">Aspera </a>with <a href="http://accelerate.im/challenges/99">Flowroute</a> to make some sort of weird photo-storage-tag-notification service. That idea flopped within about an hour of trying to figure out the Aspera API, which, at least in my case, has been a common theme with these Hackathon APIs.

We ended up making a very simple door-lock security solution using the Sensel dev boards. It uses a Python server to engage the Sensel board and fire off requests to a node API which connects to a database and web frontend.

The code is <a href="https://github.com/SleepyFishOrg/Uno">all here on github</a>, although it's pretty messy right now as we haven't touched it since the hackathon. Certain 10pm decisions include "where is the data - request body? Params? Query string? Fuck it just do req.body.data || req.query || req.params."

All in all it was a fun time, and we got an awesome new friend out of it, as well as free burritos. Though they had packed the building to slightly terrifying levels (I'm positive they would've gotten a fat fire inspection fine), there was a fun sense of camaraderie and workmanship among all the members there.
