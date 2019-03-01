# Caleb Roger's Blog

This is the repo for all files regarding the blog served at
[http://www.blog.calebjay.com](http://www.blog.calebjay.com). It is built by
the [Hugo](https://gohugo.io/) static site generator.

## Prerequisites

To build or live-develop the application, you will need to have Hugo installed.
Follow the installation guide on the
[Hugo Website](https://gohugo.io/getting-started/installing/).

## Developing

To see changes in a web browser "live," make sure your terminal
is in the root directory of this repo, then run the command

`hugo serve`

Then, open a browser and navigate to http://localhost:1313

From there, you may need to navigate to the relative URL of the article
you are working on, i.e. http://localhost:1313/posts/japan-2018

## Building

To build the blog, make sure your terminal is in the root directory of
this repo, then run the command

`hugo`

This will cause a "public" folder to be created, into which the built
HTML, XML, CSS, and Javascript will be put.

## Deploying

Deploying (updating the live website at http://www.blog.calebjay.com ) is
done by Caleb only, mostly because he hasn't sat down to figure out
an intelligent deploy process yet. Contact him at whatever contact
details you can find at http://calebjay.com/ to request a deployment.