---
title: "How I Write Code, Take Notes, Journal, Track Time and Tasks, and Stay Organized using Emacs"
date: 2021-07-07T02:16:47-08:00
draft: false
categories: ['programming']
tags: ['emacs', 'javascript', 'open-source', 'frontend', 'python', 'vue']
---

I've been meaning to write one big fat post on my Emacs journey, and how I use Emacs, for ages. It's time. I was thinking today about whether and how my life would be different if certain open-source / libre software had never been developed. Git, for example. Though I feel like inevitably some other SVN would in that case take the place of git, what if not? Same for Emacs. If I wasn't easily tracking my time-by-task for my contracting gigs through Emacs, would I just be using some app? What about the tons of notes I take in org-mode for my classes? Would I just be using Notion or Hackmd or something? Text files? What about tracking all my todos?

I guess what I'm getting at is that while probably Emacs isn't necessary to get done the kinds of things I like to get done, I really appreciate how Emacs has made all of those things very easy, all while protecting my wrists from [Repetitive Strain Injury (RSI)](https://www.nhs.uk/conditions/repetitive-strain-injury-rsi/), which was the original reason I started tinkering with Emacs back in 2016.

The first section, "Why Did I Start Using Emacs," is me just sort of blogging, and can be skipped if you aren't interested in exploring in a narrative manner why someone might pick up emacs. The other sections get into the nitty gritty.

Also, if you're a newer developer wondering whether you should try using emacs as your primary IDE, I believe you shouldn't. You should use vscode, which is enormously popular, extremely easy to use, and integrated with all the hot-new-shit webdev technology, which is probably what you're being paid to program. Focus on getting the programming job done first, spending your spare time upskilling in the wide world of webdev technologies, before you start down this path.

I'll be using [emacs style keystroke notations](https://www.gnu.org/software/emacs/manual/html_node/calc/Notations-Used-in-This-Manual.html) in this post.

* [Why Did I Start Using Emacs?]({{< relref "#why-did-i-start-using-emacs" >}})
* [On Emacs and Spacemacs Versions]({{< relref "#on-emacs-and-spacemacs-versions" >}})
* [On Programming in Emacs]({{< relref "#on-programming-in-emacs" >}})
  * [Basic IDE Needs]({{< relref "#basic-ide-needs" >}})
    * [Frame, Window, and Buffer Management]({{< relref "#frame-window-and-buffer-management" >}})
    * [Helm, or, Magic Emacs Command Suggestion and Listing Mechanism]({{< relref "#helm-or-magic-emacs-command-suggestion-and-listing-mechanism" >}})
    * [Finding Files and Text Within Projects]({{< relref "#finding-files-and-text-within-projects" >}})
    * [Finding and Replacing Text]({{< relref "#finding-and-replacing-text" >}})
    * [Managing Git]({{< relref "#managing-git" >}})
  * [Programming a Vanilla HTML, CSS, Javascript Project]({{< relref "#programming-a-vanilla-html-css-javascript-project" >}})
    * [Setting Up Javascript, HTML, CSS]({{< relref "#setting-up-javascript-html-css" >}})
  * [Programming a Vue, Typescript, SCSS Project]({{< relref "#programing-a-vue-typescript-scss-project" >}})
    * [Setting Up Vue, Typescript]({{< relref "#setting-up-vue-typescript" >}})
  * [Programming a React, Typescript, Styled Components Project]({{< relref "#programming-a-react-typescript-styled-components-project" >}})
    * [Setting Up React]({{< relref "#setting-up-react" >}})
  * [Programming a Python Project]({{< relref "#programming-a-python-project" >}})
    * [Setting Up Python]({{< relref "#setting-up-python" >}})
* [On Productivity in Emacs]({{< relref "#on-productivity-in-emacs" >}})
  * [Tracking Tasks and Time]({{< relref "#tracking-tasks-and-time" >}})
  * [Taking Notes]({{< relref "#taking-notes" >}})
  * [Journaling]({{< relref "#journaling" >}})
  * [Checking Email]({{< relref "#checking-email" >}})


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

# On Emacs and Spacemacs Versions

The emacs version doesn't matter *too* much, so long as you're above like 26. I use 27.1. [You can download emacs on the website](https://www.gnu.org/software/emacs/). If possible, I highly recommend building from source, as it's probably easier than you expect, and for me that's always led to the most stable environment.

Spacemacs is a little different, I use [the develop branch](https://develop.spacemacs.org/), which differs *significantly* from the main branch (or at least it did when I installed it). I recommend everyone use the develop branch. After following [the installation instructions](https://github.com/syl20bnr/spacemacs/blob/master/README.md#install), which have you `git clone` the spacemacs repo into your ~/.emacs.d folder, in that same folder do `git checkout develop` to use the develop branch of Spacemacs.

# On Programming in Emacs

So far, I've comfortably programmed Javascript, Typescript, Python, various kinds of Lisp, an Assembly language, Go, Scheme, and Racket in emacs. Within the web development world, I've worked with Vue, React, Styled Components, SASS, and SCSS without issue. I'll get something out of the way right now: vscode is the most popular IDE, and simply has the most developed tooling for web development. Everyone is on macbooks with vscode, that's how it is, and if you're heavily web-dev-tooling dependent, that's where your bread and butter will be. For example, [Github Copilot](https://copilot.github.com/) is only being released as a vscode extension.

Bearing in mind that I use Spacemacs as an emacs platform, I'll go project type by project type, discussing the plugins and bits of my `.spacemacs` file (the spacemacs version of `init.d`) that make me productive in those project types.

## Basic IDE Needs

There's some stuff that's universal regardless of project type. Like, project-wide text searches, search and replace, file browsing, that kind of thing.

### Frame, Window, and Buffer Management

First off, the layout of my "workspace," by which I mean the full screen on which I edit code. I use gnome as my display manager, which allows me to have "workspaces," what other operating systems or display managers might call "desktops." I feel very strongly that I paid for all the pixels on the screen, so gosh darnit I'm gonna use all the pixels on this screen. Part of the reason I hate OSX is how it makes it so hard to do that, but, rant for another day. Here's what my workspace looks like right now:

{{< img src="workspace.png" alt="Screenshot of fullscreened emacs.">}}

It's fullscreened, which you can accomplish by hitting `f11`, or have emacs launch as such by setting, inside of `dotspacemacs/init`, `dotspacemacs-fullscreen-at-startup t`.

In emacs, a "frame" is what other paradigms might call a "window." It's one "instance" of emacs, which contains multiple "windows." In the above screenshot, you're looking at one (fullscreened) frame, within which there are three windows, which other paradigms might call "frames" or "panes". Each window displays one "buffer," which kind of means "file being edited," but buffers represent things other than files, such as the output of a git command, or the output of a linter, or a list of emails. In the screenshot above, the large window on the left half of the screen is occupied by a buffer that's editing `index.md` of my this blog post, the top-right window has a buffer that is editing `map.ts` file, and the bottom-right window has a buffer in it that's editing my `.spacemacs` file. I'm going to stick to the emacs nomenclature from here on out, so bear the above definitions in mind, or [read up someone smarter than me](https://emacs.stackexchange.com/questions/13583/whats-the-difference-between-a-buffer-a-file-a-window-and-a-frame) explain it.

I usually am popping open and closing windows constantly. So for example, if I wanted to edit something at another location in this file real quick, and then quickly return back to this exact line, I'd open a new window horizontally, by doing `SPC w -`, which invokes `split-window-below`. Then, I'd jump to wherever else in the file I need to go, save, and close the window by doing `SPC w d`, which invokes `delete-window`. I'm then brought back to the previous state of my workspace, with my cursor exactly where it was when I opened a new window. Typically, if I want to open and work on a new file, I'd do `SPC w /`, which invokes `split-window-right`. Some combination of such usually results in the kinds of workspaces pictured above.

Moving around windows is easy. `SPC 1` brings me to window 1, `SPC 2` to window 2, etc. The numbers maintain sequence based on location on the screen, not when they were opened. So in the above screenshot, if I did `SPC 2` to switch to window 2, then `split-window-right`, the new window would be window 3, and the previous window 3 would become window 4.

Sometimes an action I do will cause a new buffer to entirely replace the buffer from which I performed the action. For example, if I do `, g g` in a python file, I'll be brought to the definition of the variable I'm on. If that variable is in a different file, a new buffer gets created that "visits" that file, and my window gets taken over by that buffer. When I'm done, I can do either `SPC b d`  to kill the buffer, or `SPC b p`  to go to the previous buffer. Both cases will bring me right back to where I originally triggered the action, killing the buffer simply removes it from the open buffer list.

The open buffer list can be accessed with `SPC b b`. It looks like this:

{{< img src="bufferlist.png" alt="Screenshot of a helm buffer list in emacs.">}}

Those are all the files that "are being visited" by emacs. Even if a buffer isn't visible in a window, it can still be actively visiting a file. In fact, you can switch away from a buffer without saving a file, and when you switch back, the file will still be in its modified, unsaved state. If you try to kill a buffer like this with `SPC b d` or similar, you'll get a warning from emacs asking if you want to save the file first. Incidentally, you'll get a similar notification if the file is within a git project that just had `git status` triggered on it from within emacs, using `magit`, which I'll talk about later.

This buffer list can be handy if you're working in a big project, on a somewhat large number of files. I'll talk later about how I search across projects, but while convenient, doing a project-wide file search is not a great way to quickly get back to a file you're working on. From within that list I can type the first part (or any part, really) of a file I've recently visited, hit `RET`, and I'll be taken to that buffer. This is also kind of convenient for doing things like, if in a big web project with .ts, .vue, .json, etc type files, you can do `SPC b b .json` to have the buffer list filtered to only show .json files that you've recently visited. That's more of a nice thing about helm, which I'll talk about below.

In the screenshot above, what you can't see is that I have another frame open, on a separate workspace in my display manager. I have gnome set up with 5 workspaces, that I access with `C-M-{workspace number}`. I can use that keybind to access the other emacs frame, or, I can simply use the `SPC w {number}` bind, entering the number of some window in that other frame. Frames, unlike windows, maintain sequential order, so if I have 3 windows open, then open a new frame with `SPC F n`, it will open with a window numbered `4`. If I make a change to a window on the first frame, the other frame's windows numbers will also update. This can be useful if you like to have, for example, email permanently open on some other workspace. Make that the second frame you open, and it will always be identified with the largest window identifier number (if you have 3 windows open, your email will be window 4. If 5, it'll be window 6, etc.)

### Helm, or, Magic Emacs Command Suggestion and Listing Mechanism

Emacs has a lot of commands, but it also has a strong concept of discoverability. Basically one of the most oft-recommended add-ons to vanilla emacs is an autocomplete mechanism such as [helm](https://emacs-helm.github.io/helm/) or ivy. From helm's website:



> Helm is an Emacs framework for incremental completions and narrowing selections. It helps to rapidly complete file names, buffer names, or any other Emacs interactions requiring selecting an item from a list of possible choices.

The buffer list I showed earlier was possible because of helm. Helm also makes it a lot easier to learn how to use spacemacs over time. I can press any command-intiating key, or prefix combination, such as `SPC`, `C-c`, `C-x`, or `,` (or others but those are the ones I use most office), and be shown a list of possible commands. For example, if I press `SPC`:

{{< img src="helmspc.png" alt="Screenshot of a helm buffer listing available commands in emacs.">}}

From here I can explore each of those options deeper by pressing whatever given key. It's a great way to learn all that's possible for a given major mode. For example, if you want to see what you can do in a Javascript file, upon entering one, try pressing `,` (comma) or `SPC-m`, which is typically how major mode functions are accessed, and explore what's made possible (it shows `major mode commands`).

To enable helm, add it to your `dotspacemacs/layers`, as `helm`. I think it's there and enabled by default in spacemacs, or perhaps spacemacs asks you whether you want helm or ivy during first-time setup, I don't remember.

### Finding Files and Text Within Projects

A very typical workflow for me is to do full-text searches across an entire project. By "project" I usually mean the root of whatever you get when you `git clone` something. In fact, that's basically how `projectile`, the tool that enables great project workflows in emacs, determines what "project" is as well: a `.git` directory.

For example, if I've been instructed to modify how a button works on a frontend app, I often just go look at whatever text is in the button, and then do a text search across the whole project for that text, using `SPC /`, which is bound to `(spacemacs/helm-project-smart-do-search &optional DEFAULT-INPUTP)`. Then I input the text, and choose viable candidates from a list to investigate. It looks like this:

{{< img src="projecttextsearch.png" alt="Screenshot of a project-wide text search in emacs.">}}

I can navigate up and down this list with `C-j` and `C-k` (vim conventions, I think), then open a given file by pressing `RET`. I'll be taken directly to the line where the given text was found.

Sometimes I want to find files by filename, rather than by text within them. To do so, I do `SPC p f`, which invokes `projectile-find-file`. It brings up a list of literally every file in my project that isn't in my `.gitignore`, which I can narrow down by entering some text. It looks like this:

{{< img src="projectilefindfile.png" alt="Screenshot of a project-wide file search in emacs.">}}

I generally find the sorting to be quite sane by default.

Finally, if I simply want to look at a file tree, similar to the left pane of vscode, I can do `SPC f t`, which invokes `treemacs`. It looks like this:

{{< img src="treemacs.png" alt="Screenshot of the treemacs file browser in emacs.">}}

From here I can open a file in many ways. The `RET` functionality is somewhat annoying, it'll simply open the file in window 1, taking over whatever was there previously. I can do `o h` to open the file in a new window, split horizontally from window 1, or `o v` to open the file in a new window, split vertically from window 1. I can navigate up/down with `j` and `k`, I can search within the entire file tree using `/` (discussed later under in-file text searches), and I can nest into directories using `TAB`. I can also open files and directories from here straight into `dired`, which is emacs' native file browser, but I never do that, because I'm a coward.

It's worth pointing out that it's possible to do a ton of other wild stuff with projectile and `dired`, like project-wide filename changes, but I don't know how to do that, I just know it's possible.

To do the above, you need projectile, which comes default with spacemacs. You need treemacs for the sidepanel file browsing, which can be had by adding `treemacs` to your `dotspacemacs/layers`. Spacemacs main branch used to (still does?) have some other side-panel file browser, but now treemacs is where it's at I guess.

Very important: if you want your file searches to be any kind of fast, you should install [ripgrep](https://github.com/BurntSushi/ripgrep), which is, for some reason, way faster than ag, pt, ack, and grep. You can swap around which search tool is used for these kinds of fucntions with `dotspacemacs-search-tools` inside `dotspacemacs/init`. Mine looks like

```emacs-lisp
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
```

There's some interesting integrations with between projectile and org-mode that I played with in the past, but I ended up abandoning. I mention it in case it draws your fancy. The package to investigate if this interests you is [org-projectile](https://github.com/IvanMalison/org-projectile).


### Finding and Replacing Text

There's lots of options here, because there's emacs and vim ways of doing this. Within a buffer, to quickly find text, I typically simply use `/`, which invokes `(evil-ex-search-forward &optional COUNT)`. Then, I type the text, hit `RET`, and use `n` (next result) and `p` (previous result) to browse the results. It looks like this, after I press `RET`:

{{< img src="slashsearch.png" alt="Screenshot of the result of a vim-style text search in emacs.">}}

The numbers wrapped in parentheses indicate how many results there were (the right number), and which result I'm on (the left number). In the editor, the orange-line highlighted bits of text are matching results. If I switch windows, my search is brought to that window as well, so I can hit `n` and `p` there as well to jump around.

One trick to quickly replace text is to use this search feature, combined with vim's `.` paradigm (which repeats the previous command). This is good for short text changes, such as in:

{{< highlight typescript "linenos=table,linenostart=1" >}}
const view = map.getView()
// eslint-disable-next-line @typescript-eslint/no-non-null-assertion
const zoom = view.getZoom()!

// resolution in meter
const resolution = view.getResolutionForZoom(zoom)
const range = Math.ceil(resolution / 2)

// eslint-disable-next-line @typescript-eslint/no-non-null-assertion
const [lng, lat] = transform(view.getCenter()!, 'EPSG:3857', 'EPSG:4326')
{{</ highlight >}}

To quickly change all `const` to `let`, I'd do `/ const RET` to initiate search for `const` and put my cursor at the first letter of one of the results. Then I'd do `c w let ESC` to change the word under cursor to let. Then I'd quickly press `n .` (n period) repeatedly until all `const` were changed to `let`. `c w` is a vim binding, so it comes from `evil-mode`. So does `.`.

If I wanted to change ALL instances of `const` across an entire file, I have two options (that I know of). The first is the same way I'd do it in vim, with the `%s` command. I don't know what it's called, sorry, we're in vim land now. To start it, you do `: s % /` followed by the text you want to match for, then another `/`, followed by the text with which you want to replace the matched text. You can preview the results in the window, then press `RET` to trigger the change. So, if I wanted to change all instances of `const` to `let`, my full stroke order would be `: s % / const / let RET` (remember the spaces are there as part of the emacs key notation style, it doesn't mean press space). It looks like this:

{{< img src="vimtextreplace.png" alt="Screenshot of a vim-style text search and replace in emacs.">}}

You can also do the changes one item at a time, by doing `: s % / const / let / c`. You then navigate through results, pressing `y` or `n` to either replace, or skip, the highlighted result. It looks like this:

{{< img src="vimtextreplaceconfirm.png" alt="Screenshot of a vim-style text search and replace, with confirm, in emacs.">}}

Another way to find text is to use `*`, which invokes `(spacemacs/enter-ahs-forward)`. I think this just comes baked in with spacemacs by default. To use it, you put your cursor on a word that you want to find across an entire buffer, and press `*`. It looks like this:

{{< img src="starsearch.png" alt="Screenshot of a asterik-style text search and replace in emacs.">}}

You have lots of options. You can navigate results with `n` (next) and `p` (previous), you can trigger the same search across the entire projectile project with `/` (which is the same as doing `SPC /` and entering the same text manually), or you can edit the text across the entire file. To edit all instances in the file, press `e`, which invokes `iedit`. This tool I think is a lot more powerful than I realize, but the only way I know how to use it so far is to, after pressing `e` and having one item highlighted, pressing `S` to do some magic vim "change all" type command, then entering the desired text, then pressing `ESC ESC`. So to change all instances of `let` to `const`, I'd put my cursor on one instances of `let`, then do `* e S const ESC ESC`. Again, I think this tool is way more powerful than I realize, but it does what I need it to do as-is.

Finally, to replace text across an entire project, put your cursor on an instance of the text you want to replace, and do `SPC p R`, which invokes `projectile-replace`. You're then presented with the text under your cursor in your minibuffer (at the bottom of the frame), which you can edit as needed. Then, upon pressing `RET`, you're asked which text you want to replace the selected text with. After entering that text and pressign `RET`, you're brought into a replace transient state, similar to when using the `c` flag on the vim `s%` command. From here, there's a lot of commands, so I'll just copy the full help text

```
 Query replacing regexp OLMap with butt.

Type Space or ‘y’ to replace one match, Delete or ‘n’ to skip to next,
RET or ‘q’ to exit, Period to replace one match and exit,
Comma to replace but not move point immediately,
C-r to enter recursive edit (C-M-c to get out again),
C-w to delete match and recursive edit,
C-l to clear the screen, redisplay, and offer same replacement again,
! to replace all remaining matches in this buffer with no more questions,
^ to move point back to previous match,
u to undo previous replacement,
U to undo all replacements,
E to edit the replacement string.
In multi-buffer replacements type ‘Y’ to replace all remaining
matches in all remaining buffers with no more questions,
‘N’ to skip to the next buffer without replacing remaining matches
in the current buffer.
```

Again, tool is probably hella powerful, but I just use it for project-wide search and replace. This comes baked in with projectile, no changes needed to `.spacemacs`.


### Managing Git

Working with [git](https://git-scm.com/) is so feature-rich and ideal, due to [magit](https://magit.vc/), that I've encountered dozens of people that literally use emacs for nothing other than magit. This is one aspect of emacs usage I especially recommend reading up more on outside of this post, as I'm painfully ignorant of all that's possible in magit, or the best ways to use it. That being said, I'll describe how I use it.

My most common command flow with magit is to view, stage, and commit my changes. I do so by pressing `SPC g s` which invokes `magit-status`. This is what the resultant status buffer looks like (it opens in a new split window):

{{< img src="magitstatus.png" alt="Screenshot of a magit status window in emacs.">}}

As you can see in the screenshot, the status window alone is kinda neat. You can see your HEAD branch name (`calebrogers/73-cluster-pins`), as well as the last commit title on that branch ("Zoom to cluster on click"). You can see the current Tag, if you use tags. Then, you can see untracked, unstaged, and staged files. From here, usually what I'm doing is going through my chunks and staging what I need to stage. All of this functionality is possible in git from the command line, but so much easier from `magit`. For example, if I have two changes in the same file, but I want those changes in separate commits (or I want to commit one change now and keep working on the other change before committing), I can do that! I move my cursor to the filename in question and press `TAB`, which opens up to show the changes:

{{< img src="gitstage1.png" alt="Screenshot of a magit status window with a file tabbed open in emacs.">}}

Changes are broken into chunks, which I can stage separately. I move my cursor to the header of the second chunk (`@@ -252,7`... etc) and press `s` to stage this chunk:

{{< img src="gitstage1.png" alt="Screenshot of a magit status window with an unstaged and staged file tabbed open in emacs.">}}

Now, that change is staged. From here, I can unstage it `u` or commit it by pressing `c` to open the commit options:


{{< img src="gitcommitoptions.png" alt="Screenshot of the magit commit options in emacs.">}}

I don't really do anything with these ever so usually I just immediately hit `c` again to causes two windows to split open. One has a buffer showing the staged changes, the other is a buffer where you input the commit message (the same that's opened if you do `git commit` from your terminal).


{{< img src="gitcommitcommit.png" alt="Screenshot of a magit commit split window in emacs.">}}

I type out the commit message, then hit `, ,` to run `git commit`, or `, k` to cancel the commit (leaving the files staged).

This is an enormously helpful workflow for me to review everything before I commit it, which nearly 80% of the time has resulted in me finding something that I in fact don't want to commit (like perhaps an errant `console.log`) or just want to change slightly before doing so.

Wait, that's not all! I also use magit to browse git history. First, I do `SPC g m` to invoke `magit-dispatch`, which shows a list of available magit commands:

{{< img src="magitcommands.png" alt="Screenshot of magit dispatch options in emacs.">}}

To view history, I press `l` from within this menu, which brings up `git log` options:

{{< img src="magitlogoptions.png" alt="Screenshot of magit git log options in emacs.">}}

which obviously has TONS of options. This time, I want to figure out which of my commits broke something, so I add the `author` flag by pressing `- A`, which then lists all authors that have contributed to this repository:

{{< img src="magitlogauthors.png" alt="Screenshot of magit git log showing an author list in emacs.">}}

I select myself with `RET`, then am brought back to the `git log` options, where I press `l` to log on the current branch (I think that's what I mean). I'm shown a list of all commits that match my flags:

{{< img src="magitlogcommits.png" alt="Screenshot of magit git log showing a list of commits in emacs.">}}

From here, I can choose a specific commit by navigating with `j` and `k`, then pressing `RET` to split another window that will show me a detailed view of that commit, INCLUDING a diff!

{{< img src="magitlogdiff.png" alt="Screenshot of magit git log showing a diff in emacs.">}}

If I show commits by all authors (no `- A` flag), it displays them with helpful indicators of branch points:

{{< img src="magitlogbranches.png" alt="Screenshot of magit git log commits by multiple authors in emacs.">}}

There's an incredible amount of power here, with a surprisingly usable UX, especially compared to just using git from the command line. You can also invoke magit directly on a file, for example if you want to do a `git blame` or diff that file specifically to see its `git log`. Those are the main things I use `magit` for, but I again highly recommend exploring what else can be done with it. People online constantly rave about it.

## Programming a Vanilla HTML, CSS, Javascript Project

The rarest of rare. These tend to just be personal project type things, but the tooling that these projects use are extended by all the react and vue type plugins, so worth discussing.

As an example, I'll use a really [dumbshit website](https://www.rocket.diamonds/) I made when I was trying to cash in on the Gamestop hype earlier this year. Here's [the repository](https://github.com/komali2/rocket.diamonds). Before you ask, I lost thousands on GME and I don't want to talk about it. It's because I forgot to set my limit sells before going to bed. Never ask me about this, I'll start crying in public and it'll be embarrassing for both of us.

So here's what a javascript file looks like in my editor:

{{< img src="javascriptfile.png" alt="Screenshot of a javascript file in emacs.">}}

Almost everything here is from [js2-mode](https://github.com/mooz/js2-mode).

So, we've got syntax highlighting, which is of course a bare minimum. Vim gives you that. You also have code folding, which I rarely use, but is nice for huge files.

{{< img src="javascriptfilecodefolding.png" alt="Screenshot of folded code in a javascript file in emacs.">}}

There's also syntax error handling.

{{< img src="javascriptfileerrors.png" alt="Screenshot of errors in a javascript file in emacs.">}}

`js2-mode` also implements a version of `jump-to-definition`, called `js2-jump-to-definition`. This lets me put my cursor on, for example, the first character in the line `countInput.addEventListener('input', handleCountInput);`, then press `, g g`, to be taken up to the definition of `countInput` on line 3. This is true across most programming environments in emacs, and is especially great for Python. Sure, you could do a full-project text search, but that sucks if there's duplicate function  names, or if your project is massive and uses the function everywhere. `, g g` takes me straight to where the function was defined.

Then there's a bunch of little nice-to-haves that I use sometimes. For example, `js2-ternary-to-if` is bound to `, r 3 i`, which will take a ternary and tern it to an if statement, like so:

{{< highlight javascript "linenos=table,linenostart=1" >}}
const blah;
blah = 'hello' ? 'no' : 'yes';
{{< / highlight >}}

becomes

{{< highlight javascript "linenos=table,linenostart=1" >}}
const blah;
if ('hello') {
  blah = 'no';
} else {
  blah = 'yes';
}
{{< / highlight >}}

There's some other random stuff like `js2r-wrap-in-for-loop`, but that's about it.

Here's what an HTML file looks like in `web-mode`.

{{< img src="htmlfile.png" alt="Screenshot of an html file in emacs.">}}

Those funky looking errored characters are emojis. I think you can render emojis in emacs, but I haven't bothered to set that up.

Anyway, as you can see, basic syntax highlighting. However, there's this awesome thing called `web-transient-state`, which I activate by `, .`, the common paradigm for transient states in emacs (magit has one too). `web-transient-state` is fantastic. It looks like this:

{{< img src="htmlfilewebtransientsstate.png" alt="Screenshot of an web transient state in an html file in emacs.">}}

From this state, I can quickly navigate through HTML DOM elements, using vim-style keys. `j` and `k` will move me up and down through any element, regardless of how nested. `J` and `K` will move me through sibling elements, or to a higher hierarchy if encountered, but never lower. `h` and `l` will pop me to the next deepest hierarchy, if there, or pop me out to the next parent hierarchy. I can edit stuff too: `c` will duplicate an element and all its children, `d` will delete an element but keep its children intact (and auto-indent as necessary), `D` will delete an element and all its children, `r` will rename an element to whatever type you input after pressing `r` (and its closing tag), i.e. from a `div` to a `span`, and `w` will wrap an element in whatever element type you input after pressing `w` .

There's `impatient-mode`, triggered with `, I`, that will immediately launch a web server and serve the contents of the HTML file's directory. Good for quickly checking whether styling is working, for example. There's lots of `, g` "goto" type commands that make navigating through a huge nested HTML file very nice (for example, go to parent, child, or sibling). You can instantly check for DOM errors with `, E l`. . There's also some autocomplete goodies, such as if you type out an element, like a `<div>`, when you type the upcoming slash in `</div>`, the element will close for you.

As for CSS, I mean, I dunno what vscode is doing for CSS these days, but I'm not entirely sure what there *is* to do for CSS. Here's a screenshot:

{{< img src="cssfile.png" alt="Screenshot of a css file in emacs.">}}

Syntax highlighting, hex color applied as a background color to the attribute, what else do you need? No seriously, if there's cool shit going on in the vscode world of css editing, someone tell me.

## Setting up Javascript, HTML, CSS

In an HTML file, the major mode I use is `web-mode`. In spacemacs, you get this by adding `html` to your `dotspacemacs-configuration-layers`.

In a JS file, the major mode I use is `js2-mode`. Add `javascript` to your `dotspacemacs-configuration-layers` to use it.

I believe that `css-mode` comes baked-in when you add `html` to spacemacs.

## Programming a Vue, Typescript, SCSS Project

Ok, now for an actual project. I'll be using as an example the open source [Disfactory](https://github.com/Disfactory/frontend) project I've been contributing a bit of time to. it's an app for reporting and tracking illegal factories here in Taiwan.

Here's what it looks like, in three screenshots to demonstrate the template, script, and style areas of a vue file:


{{< img src="vuefiletemplatearea.png" alt="Screenshot of the script and template portion of a vue file in emacs.">}}
{{< img src="vuefilescriptarea.png" alt="Screenshot of the script area of a vue file in emacs.">}}
{{< img src="vuestylearea.png" alt="Screenshot of the script and style portion of a vue file in emacs.">}}

I shrink down inline images in my blog to save page size, but you can click them to see the full sized image.

LOTS of goodies to go through.

First of all, there's there "lsp lens" functionality, which will show information about whatever is under the cursor. If it's an html element, it will have some information about that element and its purpose and usage. Or, if I have it on something like a Class, it will show a brief overview of some of the properties and methods on that Class, and since we're in typescript, their types! If I set the cursor on a function invocation, it'll display the parameter and return types. One of my favorite uses is under the `style` portion of a vue file, if I set my cursor on some nested SCSS rule, it'll tell me what sort of elements will be matched by that rule, which I demonstrate in the third screenshot above.

There's pretty robust "go to definition" type functionality, so for example, if I set my cursor on `MainMapControllerSymbol` in the first screenshot above, and press `, g g`, I'll be jumped straight to where that is defined, even if it's in a different file.

Check out the top of the emacs client. The header bar will display "where" I am in the file. If the cursor is in the script area, it'll show the filepath -> filename -> component name (there could be multiple components in a file!) -> script/template/style -> then break down where I am in a function. In SCSS, it'll show similar, but also include any style nesting. Same for HTML DOM nodes. Very helpful when I'm buried deep in a template.

Also, remember earlier I said that `web-mode` would still be relevant, down the line? Because of how vue mode is constructed in spacemacs, it technically has extended `web-mode`, so any functionality I mentioned above in `web-mode` is available! That means transient state for node jumping around, duplicating, wrapping, etc. The same is true for the `style` portion of a vue file!

Also, there's built in linting with `eslint`, and it pulls the rules from my project root. If there's an error, it underlines it with a little msword style red zig-zag underline, and if you put your cursor on the error, it says what the issue is. Furthermore, at the bottom of a window, it shows how many errors total there are in a file. You can list all the errors in a separate buffer, and then go item to item fixing them, if you want.


{{< img src="vuelinterror.png" alt="Screenshot of a linting error in a vue file in emacs.">}}

It works in .ts files as well, with type errors:

{{< img src="vuetserror.png" alt="Screenshot of a type error in a typescript file in emacs.">}}

Unfortunately I haven't managed to get typechecking working in vue files yet.

Typescript files also have the ability to jump not only to a given variable's definition, but its type definition as well.

Also, within typescript file, you can use `lsp-ui-imenu` to get this overview of a file, its classes, functons, etc, but I never really use this. Looks kinda cool though:

{{< img src="tssidebar.png" alt="Screenshot of the lsp ui imenu in a typescript file in emacs.">}}

### Setting up Vue, Typescript

Setting this up was a little convoluted.  First of all, I have `vue` in my `dotspacemacs-configuration-layers`. It's added as ``(vue :variables vue-backend 'lsp)`, because a lot of features require a language server. That means I also need to have `lsp` in my `dotspacemacs-configuration-layers`.

LSP itself is a bit of a rats nest to get set up. I've found [the emacs-lsp](https://emacs-lsp.github.io/lsp-mode/page/installation/) instructions to be the best, as they, unlike spacemacs, indicate all the things you need to do to get LSP working. So first, add `lsp` to `dotspacemacs-configuration-layers`. Then, you need to install a "language server" for your language of choice. Generally that means doing `M-x lsp-install-server` and choosing from the list of servers. For vue, though, that means installing [Vue Language Server](https://github.com/vuejs/vetur/tree/master/server), via `npm install vls -g`. I also had to use `M-x lsp-install-server` to install `ts-ls`, and whatever other servers helm lists for things like html, css, etc. For getting eslint and typescript linting to pull rules from your project root, you need `vue` in your `dotspacemacs-configuration-layers`, with `node-add-modules-path t`, as in `(node :variables node-add-modules-path t)**.

## Programming a React, Typescript, Styled Components Project

Wow, does React have some major tooling. And god almighty do people love it. I hate it, arbitrarily. But it's worth saying, 99.999% of people writing react code, are doing so in vscode, and so therefore, vscode is probably quite simply the "best" (has the most tooling) editor when writing React.

But doing so in emacs isn't so bad.

Here's what it looks like:

{{< img src="reactwithpeek.png" alt="Screenshot of a react / typescript file opened in emacs.">}}

You've got your syntax highlighting, bracket highlighting and autoclosing, template component tag highlighting and autoclosing, as a baseline. I think that's what comes out of the box with emacs, actually. Also in that screenshot, you can see in the middle I have an lsp "peek" open. By putting my cursor on any variable and pressing `, G d`, I can run `lsp-ui-peek-find-definitions`, which, if there's multiple definitions (for example in typescript, an `interface` and `class` might have the same name), lets you scroll through those definitions on the right with `j` and `k`, while viewing the implementation on the left. Notice that this falls through to libraries, as well. In the screenshot, I can view definitions for native react methods. If there's only one definition, you'll simply be taken directly to its file (or location, if within the same file).

Just like Vue, you can also typechecking, with error displays (see the vue section for an example screenshot) and error list capabilities. There's also IntelliSense, so you can start typing and then get a list of suggestions, as exampled in this screenshot:

{{< img src="reactintellisense.png" alt="Screenshot of an example of react intellsense in emacs.">}}

I can navigate this list with `C-j` and `C-k`, and select with `RET`. Great for finding out quick info about some component or method.

For more information specifically about typescript functionality, see above in the vue section, where I write about `.ts` files.

There's also [the possibility of debugging react](https://emacs-lsp.github.io/lsp-mode/tutorials/reactjs-tutorial/#debugging-react) in emacs, though I haven't bothered with it, because I prefer debugging directly from the browser.


### Setting Up React

You'll need to have LSP, which means having `lsp` in your `dotspacemacs-configuration-layers`. Apparently, [emacs supports IntelliSense](https://emacs-lsp.github.io/lsp-mode/tutorials/reactjs-tutorial/) and code navigation out of the box, so for autocompletions, you don't need anything. To get LSP working, though, you should also add `react` to your `dotspacemacs-configuration-layers`.


## Programming a Python Project

I'll be using the [Calibre](https://github.com/kovidgoyal/calibre) application for this example, which I had [been playing with for a personal project](/posts/calibre-automerge) recently.

Python functionality is similar to typescript, with the ability to jump to definitions with `, g g`, peek definitions and references with `, G r` and `, G d`, typechecking, error helpers and error listing, and obviously, syntax highlighting and bracket jumping. Here's what a python file looks like opened:

{{< img src="pythonfile.png" alt="Screenshot of a python file opened in emacs.">}}

There's also a lot more functionality available, especially with REPLs, debugging, and testing code. I don't get to work in python enough to speak confidently to any of this, but here's the major mode menu for a python to give you an idea:


{{< img src="pythonfilemajormode.png" alt="Screenshot of the major mode menu for python in emacs.">}}

As someone that doesn't get to dev in python too often, I especially like the helper pop-ups for native python functions. They look like this:

{{< img src="pythonnativehelper.png" alt="Screenshot of a helper pop-up for a python native method in emacs.">}}


### Setting up Python

Just add `python` and `lsp` to your `dotspacemacs-configuration-layers`, and use `M-x lsp-install-server` to install the python LSP server.

# On Productivity in Emacs

I use emacs for more than just programming in my life. As a frequent contractor, I also use it to track my tasks against companies and projects, while also tracking my time against companies, which makes billing quite easy. In general, I use emacs for all of my task tracking. I also use it for taking notes for meetings, which connects well into my task management flow. Finally, I use it for note taking for things like classes, with tooling that leads to very cool opportunities for linking the various things I'm learning and reading about. Oh, and because why not at this point, I also check my email from within Emacs.

## Tracking Tasks and Time

Similar to magit, I have heard countless stories of people using emacs solely for [org-mode](https://orgmode.org/). Org mode is a sort of markdown-editing mode, except instead of markdown files, it's used to edit org files (`.org`). The best way to learn a quick overview is to play with the example of an org file on the front page of the org-mode website.

I'll go through a couple flows I use for tracking tasks. After, I'll demonstrate what parts of my `.spacemacs` enable a given flow.

First, the basic intake. Imagine the following scenario: I get a call from my manager, and he says "look into why screenreaders aren't working on xyz.com/blah". I press `SPC a o c` to run `org-capture`, where I'm presented with [keys assigned to my custom capture templates](https://orgmode.org/manual/Capture-templates.html).


{{< img src="orgcapturetemplates.png" alt="Screenshot of a list of org capture templates in emacs.">}}

I press `w` to initiate the recording of a `work` TODO item. Then I press `, , ` to save this TODO item.

{{< img src="orgcapturework.png" alt="Screenshot of an org capture window in emacs.">}}

Done! Later, it's time to start work, so I press `SPC a o o` to invoke `org-agenda`,

{{< img src="orgagendalist.png" alt="Screenshot of an org agenda list in emacs.">}}

`w` to access my list of work related agendas,

{{< img src="orgagendasublist.png" alt="Screenshot of an org agenda submenu list in emacs.">}}

then `w` again to access my general work agenda.

{{< img src="orgagendawork.png" alt="Screenshot of an org agenda in emacs.">}}

Now I can see a list of tasks! The task my manager just gave me has a deadline tomorrow, so I navigate to it with `j` and `k`, then press `, d d`  to invoke `org-agenda-deadline`. Now, the task will appear under the deadline area at the top of my agenda:

{{< img src="orgagendadeadline.png" alt="Screenshot of an org agenda with a todo item that has a deadline in emacs.">}}

It's time to get to work on this issue, so I move my cursor to the item, and do `, C i` to invoke `org-agenda-clock-in`. A timer has started that will record how long I work on this issue. When I'm done working on the issue, I go back to the TODO item and do `C-c t` to cycle the state from `TODO` to `DONE`. Doing so automatically invoked `org-agenda-clock-out`, and so now my total time against the task has been logged. Here's what the todo item looks like now from the agenda:

{{< img src="orgagendataskdone.png" alt="Screenshot of an org agenda with a todo item that is completed in emacs.">}}


That's just from the agenda view, though! Behind the scenes, what all these commands have *actually* been doing is modifying text in a file called `inbox.org`, where I've chosen to organize general tasks like this. I can press `RET` on the task from the agenda to be taken directly to its location within the org file. Here's what a portion of the file looks like:

{{< img src="orgbasicinbox.png" alt="Screenshot of my inbox.org file in emacs.">}}

All of the information is recorded against the item. The clock time is inside the `:LOGBOOK`, the `CLOSED` date is tracked as a timestamp, as is the `DEADLINE`. org-mode knows its a `work` TODO item because of the `:work:` tag. And the state is determined from whether there's a `TODO` or `DONE` at the beginning of the item.

Now, it's time to get my boss to pay up for however long it took me to fix his issue. I have an org file for each of the companies I do work for, and at the top of each is an [org clock table](https://orgmode.org/manual/The-clock-table.html). Here's one for one of my personal weekly reviews:


{{< img src="personalclocktable.png" alt="Screenshot of an example of an org clock table in emacs.">}}

There's tons of power there, you can make a table that pulls only from certain files, for certain tags, for certain time periods.

I have a couple other flows, but first let me talk about how the above is possible.

First, obviously, you need org-mode. Add `org` to your `dotspacemacs-configuration-layers`. For reasonable control over your agendas, you also need [org-super-agenda](https://github.com/alphapapa/org-super-agenda). Add `org-super-agenda` to `dotspacemacs-additional-packages` (NOT configuration layers).

Org requires hella configuration. The first part of configuration goes within the org declaration inside of `dotspacemacs-configuration-layers`. Here's mine:

```emacs-lisp
(org :variables
  org-directory "~/Dropbox/org"
  org-projectile-file "~/Dropbox/org/projects.org"
  org-enable-roam-support t
  org-enable-org-journal-support t
  org-roam-directory "~/Dropbox/org/notes/"
  org-roam-index-file "~/Dropbox/org/notes/20200526213916-index.org"
  org-default-notes-file (concat org-directory "/inbox.org")
  )

```

`org-directory` determines your root org directory, against which many org functions are invoked. Having it within a Dropbox folder can be useful for backing up, but also if you use org-mode management apps on your phone, or just use org-mode on multiple machines.

`org-projectile-file` can be useful if you want to use org-projectile. I don't use that anymore, but it's cool for doing things like creating TODOs on a per-projectile-project basis.

Roam and journal will be discussed later.

`org-default-notes-file` determines where org captures will be saved if you don't pass in any custom template properties. I use `inbox.org` because I follow a sort of [Getting Things Done](https://gettingthingsdone.com/) (GTD) type workflow. Because of the powerful nature of org agenda filtering and the ability to write custom capture templates, it's not necessary to do a lot of organization by filetype. I'll demonstrate why later.

Now for even more customization. Inside of `dotspacemacs/user-config`, create a `with-eval-after-load 'org` invocation. This function causes included code to run after the passed-in mode has been loaded, in this case org-mode. Like this:


```emacs-lisp
(with-eval-after-load 'org
;; ...where all our further configuration will go
)
```

Now, I might be wrong about some of this stuff, as I recently learned I was putting stuff within this `with-eval-after-load` that could instead go up under `(org :variables)`, so take what I write with a grain of salt. This is just how my `.spacemacs` is set up and it seems to work great.

First, require `org-agenda`.


```emacs-lisp
(with-eval-after-load 'org
  (require 'org-agenda)
)
```

That way you can use agendas. Then, activate `org-super-agenda-mode` by default:

```emacs-lisp
(with-eval-after-load 'org
  ;; ...
  (org-super-agenda-mode)
)
```

Also, apply this fix that fixes some problem that's ubiquitous but I've completely forgotten about. I think it's something about capture template hotkeys.

```emacs-lisp
(with-eval-after-load 'org
  ;; ...
  (org-defkey org-mode-map [(meta return)] 'org-meta-return)  ;; The actual fix
)
```

Now, tell org what directories and files it can look through to generate agendas and clock tables.

```emacs-lisp
(with-eval-after-load 'org
  ;; ...
  (setq org-agenda-files
    (seq-filter (lambda(x) (not (string-match "/.git/"(file-name-directory x))))
      (directory-files-recursively "~/Dropbox/org" "\\.org$")))
  )
```

Now tell org what your TODO keywords are. The default are fine, I think they're `TODO` and `DONE`, maybe some more. Whatever you put here are what org will cycle through when you `C-c t` on a `TODO` item.

```emacs-lisp
(with-eval-after-load 'org
  ;; ...
  (setq org-todo-keywords
        '((sequence "TODO" "DOING" "WAITING" "|" "DONE")))
)
```

Now for capture templates. These are what are listed when, as in my above example, you do `SPC a o c`.


```emacs-lisp
(with-eval-after-load 'org
  ;; ...
  (setq org-capture-templates
        `(("i" "inbox" entry (file ,(concat org-directory "/inbox.org"))
           "* TODO %?")
          ("m" "Meeting Notes" entry (file+olp+datetree ,(concat org-directory "/meeting_notes.org"))
           "* %?")
          ("r" "Roam Notes" entry (file+olp+datetree ,(concat org-directory "/notes/notes.org"))
           "* %?")
          ("w" "Work Todo" entry (file ,(concat org-directory "/inbox.org"))
           "* TODO %? :work:\n")
          ("u" "Curative Todo" entry (file+headline ,(concat org-directory "/curative.org") "Tasks")
           "* TODO %? \n")
          ("l" "Life Todo" entry (file ,(concat org-directory "/inbox.org"))
           "* TODO %? :life:\n")
          ))
)
```

I have a lot for various situations. `inbox` is my default, real-quick, will-sort-later capture. Because it has no tags, it'll go within a `refile` section of my inbox, so I know to organize it more later. As you can see from my other capture templates, that might involve putting it in a proper file (such as a company-specific file), or adding a relevant tag (such as `life` or `work`). Incidentally, this is what that looks like:

{{< img src="needsrefiling.png" alt="Screenshot of the needs refiling section of my general agenda view in emacs.">}}

If you want, you can have your captures stored under a new date heading, by using `file+olp+datetree`. That will result with a file organized by year, month, and then date subheadings, with the final level being the title of the note you enter. See my `meeting_notes.org` file as an example:


{{< img src="meeeting_notes.png" alt="Screenshot of my meeting notes file in emacs.">}}

Or, you can put your captures under a specific headline within a file, such as how I do for my "Curative Todo" items, because my `curative.org` file is organized into various project types, with a special place for general tasks:

{{< img src="curative.png" alt="Screenshot of my curative org file in emacs.">}}

The other half of that is your `org-agenda-custom-comands` list. There is where you generate the various agenda views, such listed when I do `SPC a o o`.
