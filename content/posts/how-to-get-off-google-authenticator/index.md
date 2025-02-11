---
title: How to Get Off Google Authenticator (and Backup Google 2FA Codes)
date: 2025-02-10T08:51:47.090Z
draft: false
categories:
  - life
tags:
  - degoogle
---

If you use Google Authenticator for your 2FA codes, and Google shuts down your account, you are fucked. There's no way to back up these codes that doesn't involve using another phone, or, your own Google account.

This is part of my  "don't trust Google as your only backup" series, since Google has "unpersoned" people before for things as trivial as accidentally violating the Play Store TOS with an app they deploy on an unrelated corporate Google account. See also: [It's Time to Back Up Your Google Maps Location History](/posts/google-maps-backup/).


## Steps


First, download [Aegis App](https://play.google.com/store/apps/details?id=com.beemdevelopment.aegis&hl=en-US&pli=1), a free and GPL (FOSS) licensed authenticator app. [Here's their github](https://github.com/beemdevelopment/Aegis). Isn't that nice?

Go to the Google Authenticator app, click the 3 lines menu in the top left, and click "Transfer codes." Click "Export codes." Select all codes you want to export (all are selected by default). Click "Next." A QR code will display. Screenshot this, then click "Next," and if you are exporting a lot of codes, another QR code will display. Screenshot this as well. It will ask if you want to remove exported codes, I recommend not for now.

Go back to Aegis, click the "+" button in the bottom right, and click "Scan Image." Scan the QR code you saw on your primary phone, selecting both if you needed to take more than one screenshot.

Boom, you've got your codes in Aegis. Now to ACTUALLY back them up!

First in the Aegis app, click the 3 dots menu in the top right, then scroll down to "Import & Export." Click "Export (Export the vault.)" A pop up will ask what format you want, and whether you want to encrypt the vault. I strongly recommend encrypting the vault, the "JSON" format. Hit "OK" or share, and save this file somewhere safe. There, now you have all your codes in a non proprietary format, and you can do whatever you want with them.

Now set up automated backups, because you should. Back in the 3 dots menu, scroll down to "Backups," and toggle "Automatically back up the vault." Select a location, and you're done.


