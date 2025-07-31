---
title: My New Life Stack - Or, Why I Haven't Opened Emacs in Two Months
date: 2025-07-30T08:01:17.200Z
draft: false
categories:
  - info
tags:
  - emacs
  - open-source
  - vim
  - personal-knowledge-management
---

I've [written about Emacs before](/posts//my-emacs-environment) because I love it, and when I started my career it was like a breath of fresh air as a frontend devleoper surrounded by stack churn.
Emacs was something old, well-wrought, used by millions, completely documented, customizable, ran on everything, and linuxy when everything else was appley.

I did everything in Emacs up to and including email. I even used Slack in Emacs for a bit. I was trying to keep hands on keyboard and Emacs made that easy.

The world chipped away at my Emacs world. I had stuck with Spacemacs since it let me get instantly productive and had sensible defaults. Me as a new engineer had no idea what kind
of keybindings made sense, and with vim and emacs around for a while, and Spacemacs adopting vim bindings into emacs, I felt I could trust what the community there was setting.
Every once in a while, an update would break magit, or lsp servers, or even org mode, or everyone would move to org-roam, and then org-roam-v2, all while I was trying to just
do my tickets and work in an environment that helped me but stayed out of my way.

One too many emails got formatted weirdly in mu4e, or accidentally sent because I mis-typed, or accidentally deleted, or I didn't see it for whatever reason, so I moved to Thunderbird. That
allowed me a unified way to see all my calendars, so I moved those to Thunderbird too, solving a key thing missing from emacs/org-mode: good calendar display.

I loved org-mode and org-roam, and I'd link together all my notes into a wicked sick knowledge graph, but org-roam was always kinda buggy, the roam buffer that displays backlinks wouldn't update, pressing enter on links
would sometimes just throw an error rather than fluidly carry me from note to note, and there was basically no way to browse my knowledge base without a PC with emacs installed on it in front of me (that happened to be
plugged into my syncthing loop). I tried Orgzly and Orgro, I tried exporting my org files to hugo and then HTML and deploying it behind a password protected web URL and then tried to script auto-deployment to it, I even
tried auto-conversion to logseq or obsidian and using those apps to view my notes when on the go. In the end, I had to acknowledge that org-mode and org-roam for notes was just overwrought and not good. It
probably could be made good, but I could spend all my time doing that, or I could spend it picking up a new framework or onboarding members to my co-op or a million other things that were probably more important. So I
switched to Trilium.

A few months ago, I sunk into a deep depressive slump, very unclear of my identity, not getting anything done outside the bare minimum at work, not clear what I should be doing with myself once I finished enough tickets to
justify my employment. Should do, want to do, I had no concept of anything really. I started reading a lot into ADHD (I can recommend "Delivered from Distraction" by Edward M. Hallowell) and going to therapy. I determined that my
TODO list had gotten insane. Endless tasks saved into org mode, endless want-to-do coding projects, videos and photos to edit, blog posts to write, trips to one day plan. All organized quite well, prioritized, split into GTD
contexts, and sometimes even scheduled and having deadlines to narrow scope day to day. Still, lacking overarching plan, context, desire, and still, endless. I tried a couple experiments with some AI TODO / calendar management
tools, and then with a VJOURNAL / VTODO / VCALENDAR that leveraged open source and self hosteable tools, which was very fun and diverting but in the end not very helpful. I realized that I didn't actually need a very portable
way to look at tasks, just capture them instantly, for later organization, and that the organization I needed captured priority in a temporal sense - this needs doing by the end of today, or tomorrow, or this week, or this month, or
this year, or sometime in the next 5 or 10 years maybe. At a given moment, depending on my energy, I could handle looking at most at a day, but I could count on the day's tasks being well organized if I regularly reviewed my weekly
and monthly tasks and moved them to where I needed them to go. This insight came from using a physical day/week/month planner for a bit (Hobonichi Techo) and realizing that I flourish with graphical, calendar-based representations
of tasks and schedules. So, the one thing missing from org-mode.

// TODO add a picture of a hobonichi week and month page

So, my tasks moved to Trilium as well.

That just left coding. At this point I saw what was happening to Emacs and was fully open to questioning my dogmatic usage of it all the way. I'd since migrated off Ubuntu to Manjaro and from Gnome to i3. I didn't really need
Emacs to manage keyboard-first interaction with my OS - the OS itself (and its display manager) could take care of that. The better I got at using the terminal the less I needed graphical UIs for file management. So why stick with
Emacs? I'd been struggling to get Spacemacs working with the most modern LSP experience - I was envious of how well LSPs and suggestions worked in Doom Emacs, let alone just a bare bones VSCode instance, but I couldn't get either of
those to work holistically well with the bindings I was used to (I still think the Doom folks, wonderful though most of their work is, are smoking crack when it comes to their default keybindings - and no Vim plugin in vscode comes
close to allowing full keyboard interaction with every aspect of the IDE even with extensive customization). Not to mention, the whole world was undergoing an AI assisted programming revolution, that my friend bullied me into partaking in by trying out Cursor, and I was hunting for some kind of happy medium between shutting my brain off and letting the AI write mediocre code, and leveraging AI tools to code much faster while maintaining quality.

So, to nvim. I'd taken a couple cracks at it before, but never was able to do so in a way that let me stay productive enough to use it in real world circumstances while closing tickets at a volume I felt comfortable with. Over the years, nvim's ecosystem has flourished, culminating in several well-established plugin managers, and subsequently full IDE packages. The one I found to be the best fit for me, with the best default keybindings, was [lazyvim](https://www.lazyvim.org/).

Out of the box, lsp worked, better than Emacs. Several AI platforms worked, such as Copilot, with built-in chat integration if I want. It came packaged with a decent git porcelain (lazygit) to finally replace the basically
irreplaceably perfect magit. It had great defaults for full-project grep, file finding, LSP jump-to-definition and jump-to-type-definition. Also, someone had written a textbook-sized [manual](https://lazyvim-ambitious-devs.phillips.codes/)
about the thing to supplement the docs (the docs I find a bit lacking, maybe because of my overall unfamiliarity with nvim).

That's the background. Now the nitty gritty:

## Email

[Thunderbird](https://www.thunderbird.net/en-US/). Specifically, thunderbird-beta, which is miles ahead of the main branch in terms of UX and features. Previously: mu4e.

I plug it into a couple Gmail accounts for work, Migadu for the co-op, and Bluehost for my personal email. Set up and configuration was dead simple which was nice coming from mu4e where I had to configure offline-imap and mu to get
it working, as well as maintain some config in my `.spacemacs`. I can even export my configs to instantly spin up a fully configured suite on a new machine. And, unlike web-based email clients, I can download my email to manage offline, and easily back up my emails.

Upsides: HTML emails actually render. A GUI makes it much easier to navigate folders, search across all accounts, manage archives. Much less buginess around failed-to-send emails.

Downsides: Microsoft-esque keybindings and not great keyboard-first flow.

I follow a inbox-zero flow and do basically no organization outside of "Inbox" and "Archive" (and spam). Lately I've been trying to delete as many emails as I can, such as related to login flows, marketing, calendar event reminders,
etc, because they were cluttering up my search (my oldest email account is 20 years old). Other than that, I try to assign emails to tasks and then archive them, zeroing out my inbox any time I look at it. This concept was once
captured beautifully in the "Inbox" app by Google, which Google killed because capitalism is the best form of economic organization to promote innovation. If you don't know about inbox-zero, you should read a blog about it and then
do it, especially if you have ADHD like me.

## Calendar

Thunderbird again. I maintain a couple calendars for work, the co-op, and my personal life (what I need my fiance or personal assistant to see). I self-host a personal-only calendar for general diary usage or planning time-based tasks (chores or the like).

Heavy calendar usage is a form of structure that changed my life and is the most basic and critical tool for me to ensure my competent participation in normal life. Without it, I'd miss work meetings, doctor's appointments, book fun
events over pre-planned dates with my fiance, hell I'd probably miss flights. Not because none of those things are important, but because that's the curse of ADHD. It comes with blessings, and luckily I can manage the curse with
structure and systems.

Here's an example of two weeks from my monthly view:

{{< figure src="calendar.png" alt="Screenshot of 2 weeks from my calendar" caption="" >}}

The color coding is fairly arbitrary and meaningless to me, it just indicates that the event is saved against
a different calendar. I have one for events my fiance or personal assistant needs to see (such as my mom's
birthday or a train departure time), one for work, one for the co-op (usually onboarding meetings), and a
publicly-facing gmail for events I need to be able to easily share and live-update (not all that possible with
CALDAV because Google and Apple collude against self hosting). Those green events are me scheduling a busy day
out to make sure I get certain tasks done on time and not overload the day more than is feasible.

I trust nothing to memory. If it needs to be remembered, it goes on the calendar. My personal assistant will
often put events on my calendar for me after booking apointments or whatever, so all I need to do in the
morning and throughout the day is take a look and see what I've got to do and when. That also makes it
easy for me to figure out when I will do what - e.g., a 2 hour gap before a doctor's appointment is a great time
to hang at a cafe and bang out a few tickets.

The flow I'm really wanting to experiment more with is where I try to lay out events (green in the screenshot)
for tasks I want to get done. I tried this with time-based tasks when I was doing my pure CALDAV experiment,
but all the UX's around that in various client apps are inconsistent. For now I just chuck events with start /
end times. That gives me a good idea what I can get done that day, or week.

## Task Management
