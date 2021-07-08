---
title: "How I Write Code, Take Notes, Journal, Track Time and Tasks, and Stay Organized using Emacs"
date: 2021-07-07T02:16:47-08:00
draft: false
categories: ['programming']
tags: ['emacs', 'javascript', 'open-source', 'frontend', 'python', 'vue']
---

I've been meaning to write one big fat post on my Emacs journey, and how I use Emacs, for ages. It's time. I was thinking today about whether and how my life would be different if certain open-source / libre software had never been developed. Git, for example. Though I feel like inevitably some other SVN would in that case take the place of git, what if not? Same for Emacs. If I wasn't easily tracking my time-by-task for my contracting gigs through Emacs, would I just be using some app? What about the tons of notes I take in org-mode for my classes? Would I just be using Notion or Hackmd or something? Text files? What about tracking all my todos?

I guess what I'm getting at is that while probably Emacs isn't necessary to get done the kinds of things I like to get done, I really appreciate how Emacs has made all of those things very easy, all while protecting my wrists from [Repetitive Strain Injury (RSI)](https://www.nhs.uk/conditions/repetitive-strain-injury-rsi/), which was the original reason I started tinkering with Emacs back in 2016.

The first section, "Why Did I Start Using Emacs," is me just sort of blogging, and can be skipped if you aren't interested in exploring in a narrative manner why someone might pick up emacs. The other three sections get into the nitty gritty.

Also, if you're a newer developer wondering whether you should try using emacs as your primary IDE, I believe you shouldn't. You should use vscode, which is enormously popular, extremely easy to use, and integrated with all the hot-new-shit webdev technology, which is probably what you're being paid to program. Focus on getting the programming job done first, spending your spare time upskilling in the wide world of webdev technologies, before you start down this path.

* [Why Did I Start Using Emacs?]({{< relref "#why-did-i-start-using-emacs" >}})
* On Programming in Emacs
* On Tracking Time and Tasks in Emacs
* On Taking Notes in Emacs

# Why Did I Start Using Emacs?

In 2016, I was a few months into my first software engineering job, at Electric Imp. I had until then spent the previous 6 months developing in [Atom](https://atom.io/) on Windows, because I was in the bootcamp and just didn't have any clue what I was doing. I did, however, have a strong sense of superiority over my fellow students using [Sublime](https://www.sublimetext.com/). Every time they clicked away the "please pay for me" banner I'd smugly say some shit like "imagine paying for a text editor." Then again, during the bootcamp, one of the teachers showed us some [webstorm](https://www.jetbrains.com/webstorm/) setup they had that completely blew our little minds, so there was some attraction to the "fat, paid for IDE that can do magic." Right towards the end of this is when [vscode](https://code.visualstudio.com/) came out, which I picked right up because I liked how little input delay there was. It felt like the difference between playing a game at 60 fps and 120. People will say "acTuAllY the HuMAn EyE caN'T seE hIgHeR tHan whatever fps," I say no, vscode was smooth, I'd stake my life on it. As I remember it that was the very beginning of the vscode days, so I also got the early-adopter feeling of superiority. We bootcamp kids were big on the "we set ourselves apart by quickly adapting to new technology" mindset, so any chance we could get to get a headstart on something that might be the Next Big Thing, we took. Hindsight, I really wish I had taken a crack at writing some vscode extensions back then, the thing is so ubiquitous that I've had times at jobs where it was literally required to develop on a given app with any kind of productivity due to extension integration.

Anyway, so there's me at Electric Imp, wet behind the ears and devving on a Macbook for the first time in my life, hanging with the real grownups with actual Unix environments (I had used Windows Subsystem for Linux at the bootcamp and on reflection I'm honestly shocked I made it work). I learned a lesson very early in my life from World of Warcraft: mouse users (we called them clickers) are at a significant disadvantage to pure keyboard users. So I spent a lot of time trying to memorize as many vscode hotkeys as I could, including adding my own. As I added more and more, I realized that I wasn't really following any kind of convention, I was just making up stuff that kind of made sense, resulting in contradictory, convoluted hotkeys that sometimes just didn't make sense. I thought, surely smarter people than me have been mapping keys, maybe I can just copy how they do it? And right as I was in the middle of this path, I started getting RSI, really *really* badly.

From going to meetups and mini hackathon type things, I'd hung out with enough older engineers to know that RSI was a pretty serious problem to get as an engineer. I remember one older guy used to carry around a split keyboard  with his laptop because otherwise he literally couldn't type, so bad was his wrist pain. I remember articles getting posted on Hacker News, speculating on how to treat RSI, and the comments getting thousands deep. I pretty quickly realized that the main cause of mine was constantly moving between my mouse and keyboard, so I doubled down on trying to stay keyboard-only in vscode.

Inevitably, I took a look at [vim](https://www.vim.org/). I had until then only two knowledge points about vim:

1. My buddy Riley complaining about how much time was wasted in one of his college courses learning vim because some purist computer science teacher was trying to convince the students that "no you'll definitely need this, and it's a better way of writing code anyway." The way he described it, with different modes for writing and navigating code, sounded nightmarish.

2. My also-sort-of-purist coworker at Electric Imp that used vim and various gnu/linux tools exclusively as his programming environment.

Regarding my coworker, while part of me wanted to roll my eyes at what seemed to be outdated tooling, I had to admit it was cool to watch him work. And sometimes he worked vim magic that I had no idea how to replicate in vscode, I wasn't even sure if it was possible. At the very least, I liked how he never had to take his fingers off the keyboard, so I decided to spend some time trying out vim. At the very least, I thought, I could port some of the keybindings over to vscode.

I poked around some resources before finding the very cool [vim adventures](https://vim-adventures.com/) game. You navigate a little character around obstacles using vim commands. That combined with the built-in `vimtutor` got me to where I could at least switch between the two main modes of vim, and get some basic things done. From there it was just practice, which I did, on and off. At work, if what I was doing mostly involved staying in one file, I'd try editing in vim instead of vscode. It was great, my wrists were already thanking me.

Of course, vim alone is not an IDE, it literally edits text and nothing else, unless you start adding plugins. And so started a *very* sloppy and indecisive journey, where I waffled between trying to turn vim (or [nvim](https://neovim.io/)) into a passable IDE, and trying to get a vim plugin working in vscode in a reasonable way. The first path involved a lot of accidental destruction of my vim and nvim environments due to all the methods of installing plugins that were supposed to "make it easier," a lot of trying to copy other people's `.vimrc` files, starting from scratch my own, and other great ways of diving head-first into rabbit holes. As for vim plugins for vscode, back then they kinda sucked, or at least they did on my machine. Their input lag was abysmal, I was never sure when I should try to use a vim `:command` or instead a vscode native command, and when I did want to access vscode functionality, there was always conflicts. It sucked.

During this process, I had learned about emacs and [the emacs vs vim holy war](https://en.wikipedia.org/wiki/Editor_war). I also tried it out a couple times, but found that the convoluted key combinations were doing more harm than good. On that note, I did pick up one tip during this time period that probably, more than anything else, has saved my wrists: rebinding CAPS to CTRL. What a lifesaver that has been. Absolutely essential for emacs usage of course, considering how many critical key combinations start with CTRL (or `C-` in emacs-lingo), but in general has been great across all situations for me. Hell, even gaming.


Once I started realizing that vanilla / modded vim, nor vscode with vim plugins, was going to be any good, I started feeling pretty down. I don't know if it's my ADHD or just my personality, but any kind of friction between me and the task at hand is particularly painful, and there was all sorts of friction between me and getting code on the screen where I wanted to. I was idly browsing more through more vim vs emacs holy war stories, when I started hearing tell about `evil-mode`, which is a sort of vim plugin for emacs that makes emacs a [modal editor](https://unix.stackexchange.com/questions/57705/what-is-a-modeless-vs-a-modal-editor) with vim bindings, while still leaving access to all the emacs functionality. That bit of information led me straight into the hands of the at-the-time most popular Emacs suite of plugins, [spacemacs](https://www.spacemacs.org/). In their words, "The best editor is neither Emacs nor Vim, it's Emacs and Vim!"

Even back then, when I was almost utterly unfamiliar with emacs (and the vim bindings I was using with spacemacs), it felt like exactly what I was looking for. I could have the side-bar file browsing I for whatever reason really lean on when I'm editing. I could have full-project text search and replace. I could have easy window / tab splitting and switching. In fact, after a while, I found I could have all of those things at a much greater power and flexibility than I could at vscode. *And* it was hella fast. *And* it seamlessly worked with the vim bindings that I had grown to appreciate, that let me keep my fingers entirely on the keyboard.

I dedicated a month or two to using spacemacs exclusively, until I could at least match my productivity in vscode. I'd switch back during critical times, but I'd note what functionality had dragged me back to vscode, and then when I had time, learned how to do the same in spacemacs. It took about two months before I was fully integrated, and to my joy I could do my entire job without ever moving my hands off the keyboard (except to use Jira). Nirvana, and that was just the beginning.

As I was using emacs, I was hearing rumors here and there of things like org-mode (task and time organizing in emacs), or mu4e (email within emacs), and various other weird shit people were forcing into emacs. RSS reading. Webcomic browsing; hell, *all* their internet browsing. And with all this came that kind of weird but kind of cool and arguably quite ethical [gnu](https://www.gnu.org/) community. I was settling right in. Emacs was militantly open source, kinda old school, completely modifiable, and had a huge swath of things for me to learn about it. Also, it felt kinda neat being the office emacs guy. Can't deny that.

So, why did I commit to the switch?

1. I could use emacs to do my job (writing code) without taking my hands off the keyboard. Over time, more and more of my job could be done within emacs, such as handling emails (I'll talk about this more later).
2. emacs as a tool and its community / developing entity (gnu) are radically pro-software freedom. I was (and am) attracted to this movement
3. It felt kind of [brutalist](https://en.wikipedia.org/wiki/Brutalist_architecture), which, take a look around you at this blog, dunno if you can tell, but I'm really into. It was quite simple on the face, but at the same time quite capable.
4. It's ostensibly an older, or baseline technology, which I'm just attracted to for whatever reason. I don't really know yet how to define this feeling, but the best I can say is this reason for liking emacs is the same reason I like being good at git, or learning unix tooling (sed, grep, etc).
5. I could use vim commands and hotkeys within it, which let me do some pretty wild code editing

Now for the actual environment, and part of the blog post other people might actually find useful.

# On Programming in Emacs

So far, I've comfortably programmed Javascript, Typescript, Python, various kinds of Lisp, an Assembly language, Go, Scheme, and Racket in emacs. Within the web development world, I've worked with Vue, React, Styled Components, SASS, and SCSS without issue. I'll get something out of the way right now: vscode is the most popular IDE, and simply has the most developed tooling for web development. Everyone is on macbooks with vscode, that's how it is, and if you're heavily web-dev-tooling dependent, that's where your bread and butter will be. For example, [Github Copilot](https://copilot.github.com/) is only being released as a vscode extension.

I'm so
