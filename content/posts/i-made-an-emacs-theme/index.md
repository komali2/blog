---
title: "I Wrote an Emacs Color Theme"
date: 2019-05-03T02:16:47-08:00
draft: false
categories: ['programming']
tags: ['personal-project', 'open-source', 'emacs']
---

TLDR I made a color theme as close as I could to VSCode's "Default High Contrast" and here is the url: https://github.com/komali2/Emacs-VSCode-Default-High-Contrast

As part of this weird "dev optimization" obsession I've been having recently, I've been messing around with established tools like Vim, Emacs, and
various other Linux / open source / "you probably should know these" type tools. Typically I work in VSCode, and in my opinion I'm pretty darn good
at using it, but I was getting tired of taking my hands off the home row - even moving them to the arrow keys was troublesome, and starting to mess
with my wrists. So I hopped back and forth between Vim and Emacs, deciding that the Emacs keybindings are awful, the Vim ones are amazing, but the Vim
library for VSCode was just not going to cut it. Too much overlap with VSCode commands, implementations not as smooth as they were in Vim itself, it
just wasn't going to work. But, neither was Vim, because I "needed" (so I tell myself) the IDE features I get with VSCode, like search across all files
in a project with something as simple as `CTRL+SHIFT+F` or find a file by name with `CTRL+P`. These can be added to Vim, but it was a headache. I was
eternally switching from vim to gvim to nvim, messing with the ten different "most popular" package manager, stuff wasn't working. Awful.

Long story short, Emacs + Evil Mode. Which, also, sucks to config. Basically, all the same problems I had with Vim - way too much effort to get a working
IDE. I didn't even need an out of the box solution, I just needed something that works.

So, longer story short, Spacemacs. EZ mode Emacs. To purists a sin, to someone like me, exactly what I needed. I still had to tweak the hell out of it but
at least there was light at the end of the tunnel. A later blogpost will dive into my configs, what I did to make it *just* like VSCode in all the right
ways, but for now, I want to focus on color theme.

It seems silly, but a reason I wasn't as keen on leaving VSCode was how pretty it was to me. I had got a theme on it that reminded me of old vector
arcade games like [Tempest](https://en.wikipedia.org/wiki/Tempest_(video_game)). I mean, look at it:

{{< img src="vscode-theme.png" alt="Screenshot of the Default High Contrast theme in VSCode." >}}

    The Default High Contrast theme on VSCode.

So, to create an Emacs Color theme... but not just an Emacs one, a Spacemacs one. Pretty much the same thing, but there
are some command "gotchas."

# Creating the Theme
First off, don't treat this like a tutorial, because I am obviously garbage at this, as will be seen from my stupid
workarounds I had to do just because I don't actually understand how to use Emacs or Vim. This is just a way for me
to get this all down so I don't have to try to remember it all later.

First stop is [this little page](https://www.gnu.org/software/emacs/manual/html_node/emacs/Creating-Custom-Themes.html)
on the gnu website, which like all Emacs help articles are at first glance hilariously short, but on reading actually do
give you all the information you need. It instructs one to open the Theme Customization Tool via
`M-x customize-create-theme`. You get the choice of populating the theme with some sane defaults, which is a good idea
because there's hundreds of "Faces" (more on that) to choose from. It looks like this 2:

{{< img src="emacs-theme-editor.png" alt="Screenshot of the Emacs Theme Editor" >}}

    The theme editor in Emacs.

It's got a full on editor, with menus and descriptions of what each  "face" are - very neat! There's
even samples of what the theme will look like. Furthermore, there's way more powerful options available
here than in VSCode - each "face" has "attributes" ranging from font and background / foreground color to boxes,
underlines, slants,  etc. Lots of fun options that I'll have to consider exploring.

**Faces** are, as best as I can tell, "how a given character looks." It's a sort of "thing" applied to a given character,
and as far as I can tell Emacs itself as well as various major modes trade deciding what "thing" a given character has
applied to it. For example, there's Font Lock String that generally applies to Strings across all Major Modes, but there's
also `js2-jsdoc-tag`, which applies to jsdoc tags in Javascript files (or any file with js2 mode). Faces don't appear
to just be characters in a given position, they are also the cursor itself, or the modeline.

**Attributes** are the visual changes you can apply to a Face. You can decide a given Face should be a different font,
a different color, have a box around it, etc.

So, you pop this thing open. But I'm in freaky ass Spacemacs evil mode, so clicking on the dropdowns and buttons
doesn't seem to do anything. Apparently, you've got to put your cursor on a button or dropdown, then hit `ENTER` on it.
You can also `TAB` or `SHIFT-TAB` around.

One thing that was good to try was hitting "Visit Theme" and exploring some of the other ones. They turned out to be too
complex to be worth going through and modifying - better to just start from scratch.

There's a gotcha: Filenames have to be something-something. No spaces or any other fanciness. The file will be saved like
`test-theme.el`, with "theme" being added automatically. It's just a lisp file generation tool, this thing. Make a bad
name and you won't get an error, it'll still save and everything, it'll just wipe out everything next time it tries to open
(unless you open the file as text and fix it, or rename it).

On saving: It's `C-x C-s`, not `SPC f s` like I usually use to save.

The hard part: how do you figure out all the different Faces that you want to change? So you pop open a javascript file,
and the colors are all different in different places, how do you figure out which color maps to which Face? The command you
want is `what-cursor-position` which apparently in vanilla Emacs has a very friendly keybinding, but in Spacemacs is not so
straightforward to enter. Commands like that are typically entered via `M-x {{command}}`, but if you try that in Spacemacs
for the `what-cursor-position` command, it just shows a single line of text instead of the big box of tons of information it
should show.

{{< img
    src="what-cursor-position.png"
    alt="Screenshot of the output of M-x what-cursor-position"
    width="829"
    height="585" >}}

    What the output of `M-x what-cursor-position` *should* look like.

The good bit in that screenshot is the "face" portion towards the bottom - "hl-line". Except, that's an overlay... the overlay
that always shows up because it shows where the cursor is. If you scroll down, it shows the actual face applied to the character.

So, to get that, you need to invoke the `C-u` command with `what-cursor-position`, but Spacemacs changed that to be "scroll up."
That means the full invocation in Spacemacs to get `what-cursor-position` to work right is `SPC SPC what-cursor-position C-u ENTER`.

Once I'd figured that out, it was a tedious matter of moving my cursor around and finding out what Faces were applied across files.
Upon figuring it out, I'd head to the bottom of the Them Creator (tab tab tab tab...), hit `Insert Additional Face`, and add the
Face I wanted to modify.

So far I've only had the patience to do the Font-Lock Faces, the mode line (kinda), js2-mode, and html-mode. Markdown is a glaring omission (obvious to me
now as I type out this blog post). Still, it has been good fun, and given me that little taste of Emacs that I think people love,
the ability to extend and hack on the editor you use to truly make it your own.
