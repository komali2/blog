---
title: "Steam as a Remote Desktop Solution"
date: 2020-01-06T02:16:47-08:00
draft: false
categories: ['info']
tags: ['digital-nomad, onebag']
---

Had a somewhat wild discovery that seems so blatantly obvious that I'm sure I'm missing something here, but here goes: it seems to me that Steam is the best Remote Desktop solution for individuals.

"Remote Desktop" solutions allow you to access your computer from another computer over a network, and that network can even be the internet. Companies use it to let IT people see or take over another employee's computer to help them fix their email client or whatever, but now that remote work is hella popular, it's getting more common to use Remote Desktop solutions to use a computer in your office from your house. Or, to use a really powerful machine, or one that's connected to a lot of storage, from a really cheap laptop or whatever that you take with you on trips or when you go out or whatever. Basically, a solid digital nomad usecase.

Companies have all sorts of wild remote desktop solutions they can look at, but most individual users get recommended something like TeamView. The problem is TeamView, and basically every other Remote Desktop solution I was looking at, really focuses on enterprise solutions, and their individual offerings, and pricing options, are obviously an afterthought. At least in my couple of hours of research, there really doesn't seem to be a good remote desktop option for individual users, or at least a good value one.

Not to mention, certain solutions that individuals might try to implement on their own, such as Windows' built-in Remote Desktop service (windows pro only), is meant for internal network usage. If you expose it to the internet, you'll be attacked almost instantly. It's possible to set this all up securely, but the stakes are high: if you mess up even the tiniest bit, a remote takeover is almost guaranteed.

Enter: Steam. I sometimes use Steam's various streaming options to play games that are on my monster desktop from my phone or Steam Deck or downstairs TV, and it's pretty slick. To do this, a PC device that can play steam games already can click a game and click "launch on {name of your desktop}," which is useless for a remote desktop solution. The interesting other way to stream games is to use the Steam Streaming app, which is available for basically every platform (windows, linux, ios, android, etc). If you use the Steam Streaming app to pair your device with your desktop, you can then connect to your PC from your remote device and launch into "Big Picture Mode," a sadly neglected UX that lets you browse and play your steam games remotely.

The key is, you can simply minimize Big Picture Mode, and you are then viewing your PC's desktop. You can do anything at this point: launch apps, browse the file system and the local network it may be connected to, launch web browsers, manage connected hardware, ANYTHING!

It seems fairly secure because you can only use the steam streaming app to connect your PC to devices that were already paired with it (which you must basically do in-person: do it before your trip!!). However, I have no idea what sort over the wire encryption is happening: you're sending mouse and keystrokes (or gamepad input) one way or the other, so just in case, don't type any passwords if you're on public wifi or whatever.

I've never bothered using other "actual" remote desktop solutions since discovering this, but I'm guessing they have some features that you don't get using Steam like this, such as maybe file transfers from remote device to hosting device. If that's important to you, this probably won't work (although you could just like, upload a file to google drive or whatever, then download it on the host device).

Other than that, I really don't see any downsides, other than maybe the somewhat clunky way you go about launching. The fact that I can plug my phone into a TV over an HDMI cable, then use steam streaming to edit 4k videos on my desktop back home, is absolutely wild to me.
