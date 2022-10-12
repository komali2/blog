---
title: Converting to Netlify CMS
date: 2022-10-12T01:46:16.085Z
draft: false
categories: "['programming']"
tags: "['personal-project', 'frontend']"
---
I've got a massive backlog of blog posts I want to write, and I'm not writing them. There's friction. I vaguely remember reading somewhere that a good way to help get stuff done is remove all obstacles you can. If you're struggling to get to the gym in the morning, leave your gym shorts and shirt right next to your bed every night so you can toss'm right on as soon as you get up. That kind of thing. 

In that spirit, I wanted to be able to write and edit my blog posts from a web UI, from anywhere, even my phone. Before, I needed a way to not only edit markdown files and commit them to github (actually, the commit step is technically optional), I needed to then run `hugo` , grab the output, and somehow put it on my server, usually through FTP. Way too many steps. 

So today I set up a Hugo + Netlify CMS + Netlify Identity stack. At first I tried the "[Hugo template for Netlify CMS with Netlify Identity](https://github.com/netlify-templates/one-click-hugo-cms)" but it was ass, and I'd need to pull in my blog to its content directory, or, copy over its weirdly large volume of unrelated files (cypress tests? why?) into my blog repo. I was on my windows machine at the time and thus didn't have much blog repo editing capabilities, but luckily the manual Netlify CMS setup was so easy I could do it from within Github's editing windows. 

[Netlify CMS](https://www.netlifycms.org/docs/intro/) is pretty straightforward to integrate. To use it, your repo with your blog or whatever needs to serve a `/admin` route that resolves to an `index.html` that Netlify provides, with a `script` tag that loads and renders their CMS admin page and code. There's also a config file that needs to be provided. Other than that, the only changes needed were to two of my html generating partials, so as to ensure redirect after login to the CMS to the actual CMS route. 

I followed the "[Add to Your Site](https://www.netlifycms.org/docs/add-to-your-site/)" tutorial verbatim and had the thing up and running after about an hour or two of work. The only snag I hit was when [fiddling with DNS](https://answers.netlify.com/t/cname-subdomain-pointing-to-netlify-cms-deploy-works-but-not-for-two-specific-routes/77241/2), switching from my blog subdomain being handled by bluehost and pointing to a specific directory on my server to instead be a CNAME pointing at the Netlify deployment. Luckily that simply resolved itself overnight. DNS!

The relevant updated files are 

* `static/admin/index.html` [Link](https://github.com/komali2/blog/blob/master/static/admin/index.html)
* `static/admin/config.yml` [Link](https://github.com/komali2/blog/blob/master/static/admin/config.yml)
* `layouts/_default/single.html` [Link](https://github.com/komali2/blog/blob/master/layouts/_default/single.html)
* `layouts/partials/header.html` [Link](https://github.com/komali2/blog/blob/master/layouts/partials/header.html)

Moment of truth incoming, their "widget" formatting for my category and tags frontmatter was weird when I loaded existing articles in, so this article publishing is a test to see if I need to follow that weird format.