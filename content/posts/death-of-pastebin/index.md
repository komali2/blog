---
title: "Death of Pastebin"
date: 2026-06-14T17:19:48+08:00
draft: false
categories: ['info']
tags: ['archiving']
description: "Notes on the spam problem in pastebin and how that's forcing to make all my pastes private."
---

Seven years ago I paid something like 50$ for a permanent Pastebin [pro](https://pastebin.com/pro) account, mostly so I wouldn't have to deal with Captchas anymore, but also so I could have unlimited unlisted pastes. It's been useful for tech support forums so I can paste in massive debug logs. I think I've even plopped pastebin links into Stackoverflow questions and answers. 

This means I have 20 something unlisted or public Pastes floating around, with a total of roughly 42,000 views across them. The subjects range from Emacs configuration through kernel settings for AMD Framework laptops, Steam streaming from linux, and Proton configuration for gaming. It's not a lot of views, but some of the pastes are really niche so I think the eyeballs count for more - I mean, how many AMD Framework 13s running Linux are there out there? The internet speculates that it's less than 400k laptops alone, and considering that Linux is at 5% market share (even accounting for the Framework nerd factor), that would mean there's substantially less than 400k out there. Conclusion: my random pastes are at least somewhat useful, which is why it's a shame I have to take all my pastes private today.

Sometime in the last year, Pastebin started getting hit with a lot of spam in the comments section. I'm not sure if there even was a comment section in the past - perhaps they recently added this "feature," and were subsequently immediately hit with the spam? Regardless, it means I'm constantly getting emails about new comments on my pastes, all of which basically look like this:


{{< figure src="spamexample.png" caption="A very helpful paste commment" alt="Screenshot of spam comment from pastebin" >}}

So far as I can tell, there's no way to globally disable comments, let alone on a per-paste basis. I tried to mitigate this by setting all my pastes to unlisted, so at least they can only be found from whatever forum they're pasted in, but that didn't help. To add insult to injury, the report process is non-trivial: it requires adding a captcha and so far as I can tell, doesn't actually make spam comments get handled any more quickly than just waiting for all the spam accounts to get hit with a banhammer every few weeks.

{{< figure src="reportform.png" caption="The spam report form also wants your name for some reason?" alt="Screenshot of spam report form from pastebin" >}}

So, though it pains the archival, anti-link-rot part of me, I'm setting all my pastes to private for now, until Pastebin allows disabling comments. I can't fathom why they haven't allowed people to disable comments, maybe they're just farming engagement and if spam is good enough for Twitter, it's good enough for them? Who knows. 

If you somehow find this blog post after encountering a rotted Pastebin link related to me, you can feel free to email me and I'll happily provide whatever the text was. In the meantime, I'm looking into some FOSS, self hostable Pastebin alternatives. So far [Pastefy](https://github.com/interaapps/pastefy) seems to be the best middle ground for features vs bloat vs deployability.
