---
title: 'Setting Up Projects for Hosting on a VPS'
date: 2023-07-18T20:32:00.001-05:00
draft: false
categories: ['programming']
tags: ['personal-project', 'open-source']
---

I've deployed a lot of web software on a lot of platforms: Heroku, AWS, Google Cloud, Netlify, Cloudflare, lol even bluehost (my [website](https://calebjay.com) and this blog). They're great for quickly spinning something up, or if you might need to rapidly scale a project, or if you're hyper optimizing an application with a lot of traffic. The downside is each of them comes with their own quirks, their own domain knowledge, their own ways of affecting literally how you program your project. I hate that, tbh. I just wanna have an app and stick it somewhere and be done, ESPECIALLY for personal projects.

Lately I've been self hosting a lot of free and open-source software that I find on the [Awesome Selfhosted repo](https://github.com/awesome-selfhosted/awesome-selfhosted), such as [an event server for events in Taiwan](https://events.thestinkytofu.com/). I have a little box in my room with like 64TB of space and 64GB of ram and go nuts. Thus I've learned a whole lot about just running web software off a linux box, which I now find a very nice way to deploy things that don't require much scaling, or the scaling is built-in like with WSGI applications like [Gunicorn](https://gunicorn.org/). I decided that this is a pretty swell way to host a lot of personal projects, which is why I rented a box for my software engineering co-op, [508.dev LLC](https://508.dev/), to use for portfolio projects.

508 has a [rapidly growing list](https://508.dev/engineering.html#internal-projects) of projects that need deployment or [are soon to need deployment](https://github.com/508-dev), so I thought a VPS box would be a good way to spin up a ton of these projects quickly and affordably. Platforms like Heroku often have minimum costs as soon as you want to point your own domain at a project, or host a database, which is silly and expensive for something like a [videogame remix guessing game](https://guessagame.508.dev/) or a [cookie clicker knockoff in unadorned HTML](https://clickbutton.508.dev/), so now I host these all on our VPS.

I recently [published a blog post](https://508.dev/blog/posts/new-project-creation.html) on the 508 blog on how I set up a new project on the VPS in general, including an example nginx config for both a static project as well as a project requiring TLS termination through a reverse proxy. If you're interested in how you might set up a VPS for personal projects writ large, this could get you started on the right path.
