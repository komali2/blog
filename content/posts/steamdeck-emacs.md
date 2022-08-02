---
title: 'Installing Emacs on Steam Deck'
date: 2022-08-01T19:36:00.002-06:00
draft: false
categories: ['programming']
tags: ['emacs', 'steamdeck']
---

Part of my goal for the Steamdeck is to use it for what I think it's not being truly appreciated as: an Archlinux computer with a pretty decent chip in it, and lots of drivers to make using it as an actual computer already installed.

So, I want to try coding, blogging, taking notes, journaling, and etc on it. I want my normal dev environment on it! That means installing Emacs. Specifically, gccemacs, so my lisp libraries are all compiled to native code and run faster. Apparently. I'm actually a noob and often talk out of my ass when it comes to Emacs.

I was considering compiling Emacs on my own, which I usually do and works fine, and because the Ubuntu Emacs packages are always out of date, but turns out the Arch folks maintain up to date branches of Emacs that are installable as packages from their AUR site.

Takes some setting up.

First, one must go to desktop mode.

Because `sudo` commands will be happening, one must set up a password for your user on deck, can happen through settings or `passwd`

Must do something with keys maybe? Getting "signatore from name email is unknown trust"

And install base-devel
