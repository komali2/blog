---
title: 'How to use VOIP and Google Voice to Have a 10$ Phone Bill'
date: 2014-08-14T19:51:00.001-05:00
draft: false
categories: ['info']
tags:
---

I came back to the States and almost died of laughter when AT&T offered me a talk/text phone line with 1 gig of data for 60$ a month. Sixty bucks a month to get charged overage when I instantly blow through my gig of data? Besides the fact that I personally find AT&T to be about as evil as Comcast or BP, I simply cannot justify paying that kind of money, especially when T-mobile offers me an _unlimited data plan_ for 10$ a month.

With a little VOIP and google voice fenangling, I managed to turn that 10 dollar a month data plan into a full blown talk and text solution. In this blog post, I'll save you the headache so you can do it yourself.

You'll need an android smartphone. Iphone options exist, but are beyond my experience.


#### If you are looking for a way to use VOIP to have a data-only cellphone that can send outbound calls and receive inbound calls, send texts and receive texts, and have unlimited access to the internet, this article is for you. 


**Usability**

I'm basically paying T-mobile for a constant data connection that will allow my phone to listen for a VOIP call. The "long" solution has a somewhat poor usability over 3G because of how many SIP trunking hoops a call has to jump through, but the "short" solution works just fine over 3G. T-mobile tells its customers that they're paying for "1 gigabyte of high-speed internet and unlimited low-speed internet" or some such nonsense, and then tries to sell plans with 3 gigs and up of "high-speed internet." In practice, I've managed calls just fine both before and after I've "used up" my high speed internet for the month. Basically, you're paying 10 bucks for unlimited internet.

Texts and calls in the US are handled for free through google voice, meaning I only pay T-mobile for the data plan. The "long" solution will require a one time payment to Flowroute of 35$. After that, you pay 1$ for a phone number from the 35$ deposit, and then an absurdly small amount of money for minutes of call time, also taken from the deposit.

**Short Solution**


1.   Go get a 10$/mo data-only SIM card from T-mobile. Stick it in your phone.
2.   Go to google.com/voice, get a google voice number.
3.   Google and download "GrooVe IP 1.4.8 APK". Get the APK. Install it.
4.   Log into google voice on your phone. Go to settings. Under "making calls," set "use google voice to make all calls."
5.   Go into the GrooVe IP app, allow it access to the same google account you use google voice with.
6.   Go into settings. Select "allow 3g/4g calling."



Note: This solution is something google actively tried to prevent, which is why you need an old version of GrooVe IP for it to work. For a more extensive, "legal" solution, see below.

**Longer Solution**


1.   Go get a 10$/mo data-only SIM card from T-mobile. Stick it in your phone.
2.   Go to google.com/voice, get a google voice number.
3.   Go to Flowroute.com
4.   Sign up for an account
5.   Deposit the minimum required deposit of 35$ under the "add credit" option on the main page of your "dashboard"
6.   Click the DID tab
7.   Click the "Purchase" tab
8.   Choose a phone number. It doesn't really matter, your google voice number will be what you give people. Choose a basic number, rather than "memorable" or something else that costs more. Click "purchase". 
9.   Click the "interconnection" tab, scroll down until you see SIP Credentials. 
10.   On your android phone, go to the "phone" app. Press "settings." Scroll down to "Internet Call Settings." If you don't see this option, get an SIP app such as [SIPDroid](https://play.google.com/store/apps/details?id=org.sipdroid.sipua&hl=en) to handle the next few steps. 
11.   Under "Accounts", select "add acount." 
12.   In "Username," input the data from the "Username & Auth Username" field on the flowroute page. 
13.   In "Password," input the data from the "Password" field on the flowroute page.
14.   In "Server," input the data from the "SIP Registrar / Proxy" field on the flowroute page.
15.   Select "Set as primary account." 
16.   Go back to the "internet call settings", select "Receive incoming calls." 
17.   Go back to phone settings. Under "Use Internet Calling," select "for all calls when data network is available." 
18.   Download the Voice+ (Google Voice callback) app to your phone. [Link](https://play.google.com/store/apps/details?id=hu.xilard.voiceplus) 
19.   Open the app. Select "Outgoing call integration."
20.   Select "google account," choose your google voice account. It will show a list of numbers. Move your "google talk" number, which may just be your email address, to "visible numbers," and everything else to "hidden numbers." 
21.   Open the google voice app on your phone. Go to settings. Select "making calls" and choose  "use google voice to make all calls." 
22.   On your computer, login to voice.google.com. 
23.   Under Settings, select "add another phone." 
24.   Add your Flowroute SIP number you purchased earlier. 
25.   Under the "phones" tab (the default tab when you login to google voice), select "forward calls to" your flowroute SIP number. 



That's it. Give people your google voice number. When they call you, it'll be forwarded to your flowroute SIP number, which is then received by your phone as an internet call. When you call people, you'll receive a "call-back" from the Voice+ app, which, upon answering, you will be connected to whoever you called. All texting will need to be done through the google voice app.

I much prefer the shorter solution, because it is far more effective and simple, however I have the second solution as a backup for if google ever somehow locks down outdated apps having access to google voice.

If you have any questions, alternative solutions, or comments, feel free to share below!

Thanks is well deserved by those that helped me come up with this solution: flowroute customer service, /u/devilbunny,  and /u/joekamelhome.
