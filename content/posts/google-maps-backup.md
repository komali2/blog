---
title: "It's Time to Back Up Your Google Maps Location History"
date: 2024-07-26T22:32:00.001-05:00
draft: false
categories: ['info']
tags: ['open-source', 'degoogle']
---

Google Maps "Location History" is now called "Timeline" and is [no longer available](https://support.google.com/maps/answer/14169818?visit_id=638576580733050644-2160119744&p=maps_odlh&rd=1)
on desktop. Gone as well is the method we all used to back up the Location History, which
involved downloading the history in Takeout or just from the Google Timeline webapp.

Now, Timelines will only be available on a single mobile device. Ostensibly for security reasons. This kills a ton of usecases, e.g. I used it for writing up blog posts or editing videos while sharing my routes on trips or motorcycle rides, looking at the timeline on one portion of my desktop. Jokes on anyone if they think I'm gonna hunch over my phone to do that.

Also, with Timeline history only available on one device, if you lose that device, that's it. Google alleges to have an encrypted backup method available, but one backup is not a backup, especially if Google is
holding the keys. As Cory Doctorow [recently wrote in his article, "Unpersoned"](https://pluralistic.net/2024/07/22/degoogled/),
Google can randomly and arbitrarily decide you shouldn't have a Google account anymore, and permanently
delete all your data, with no recovery method, and no support contact solution. So, back up your Google stuff!

# How to Back Up Your Google Maps Timeline

First, if you haven't had the notification on your phone about saving your Google Timeline data locally, or
if you have had it but haven't done so, don't do the transfer! First, use [Google Takeout](https://takeout.google.com/?pli=1)
to download your maps location data. This option should still be available to you if you haven't activated
the new "one device only" feature for Google Timeline.

However, if you've already opted in, or if you're reading this article after late 2024 when we've all been
force-migrated, fear not, you can still (for now!) back up your Timeline data in a non-proprietary format.

1. On your phone, go to Device Settings
2. Tap `Location`
3. Tap `Location services`
4. Tap `Timeline`. This should open up a new app, or your Google Account switcher if you're logged into multiple Google accounts. Choose your account your location history is saved against.
5. Tap `Export Timeline data`.
6. Tap `Continue` in the modal that opens. It says it will "save a copy of your Timeline data from this device," however that doesn't mean it will only contain the data on that device since the changeover - so long as your historical data was brought onto the device during the migration, you should have your entire location history on-device.
7. Save the file to your device, and, I strongly recommend backing it up elsewhere, not just Google Drive! You can look into off-site third party backup solutions like Backblaze.
8. After saving, tap the `Backup` button for good measure, since Google won't accept your huge JSON file to import location data later if you want. You'll need to use their proprietary Backup solution if you want your location history to be restorable within Google apps.

Now as for what to do with that huge JSON file, I have no idea yet. I'm working on another blog post about
liberationist software and my general move away from Google and other proprietary cloud products, so
when that comes out I'll hopefully have discovered an alternative Google Timeline solution.
