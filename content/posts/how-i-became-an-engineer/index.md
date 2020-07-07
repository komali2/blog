---
title: "How I Became a Software Engineer"
date: 2020-06-14T02:16:47-08:00
draft: false
categories: ['programming']
tags: ['job-hunt', 'bootcamp']
---

Some people are in the phase of life that I was in in late 2015 (recruiter, with liberal arts degree, and
a fairly boring future lain before them), and asking how I got from there, to where I am today (full time
employed software engineer, making more money than I ever dreamed of, with a level of freedom in my work
I never thought I'd get).

Me getting asked a question more than once typically results in a blog post.

I'm writing this to illustrate how one can become a full time software engineer without getting a
computer science degree (minus the job search itself, which I cover extensively elsewhere in my blog). I also cover
why you might want to do that.

* [Who Was I Before I Was an Engineer?]({{< relref "#who-was-i" >}}) - For people who aren't sure they have "the right background"
* [Why Did I Decide to Become An Engineer?]({{< relref "#why-did-i" >}}) - For people that need convincing
* [What Did it Take to Get Into a Coding Bootcamp?]({{< relref "#what-did-it-take-to-get-into-a-coding-bootcamp" >}})
* [What Did it Take to Survive a Coding Bootcamp]({{< relref "#what-did-it-take-to-survive-a-coding-bootcamp" >}})

## Who Was I

In late 2015/early 2016 I had a Bachelor's of Arts in Creative Writing, minor in Anthropology, from the University
of Houston. I had 6 months experience working for a non profit in Taiwan (AIESEC), and another 6 months teaching
English in Taiwan. For the entire year of 2014 I was in Houston working as an engineering recruiter.

I had little to no experience in programming, besides some small messing around with HTML growing up,
stealing code to embed music in my InvisionProBoard forums, copy/pasting LUA scripts for Gary's Mod,
and a Java programming class in Highschool that I probably cheated my way through. I had below
average math scores on my SAT and ACT (something like 40th percentile if I remember correctly) and
above average scores on the reading/writing sections (90th percentile). I had a 3.4 GPA. The most
advanced math course I took in college was pre-calculus, which I got a C+ in.

## Why Did I

Some parts of recruiting were fun, others sucked. KPIs sucked. Showing up to work at 7:15 sucked. The fact that
my job was essentially "beg engineering managers at Jacobs and BP to hire your engineers" sucked. My favorite
part of that job was messing with excel spreadsheets to find client contacts we hadn't talked to in a couple
years. I wasn't making much commission because I wasn't very good, and the oil and gas market was crashing,
so the pay sucked. The career advancement was basically recruit, lead recruiters, start recruiting company,
retire.

Taiwan was fun. Teaching English was exhausting, when you were actually doing it, which you only really had
to for 12 hours a week. But then you'd go to a bar and there'd be some 42 year old balding white dude
creeping on the local girls, still teaching English, and you realized life was so comfortable that
that could easily become you. So I left that.

My engineer roommate could work from home whenever. He made 3x what I did and basically spent 2 hours a day
tweaking some spreadsheets, then the rest of his day playing Counter Strike: Global Offensive. A friend of mine
learned enough Visual Basic to automate that 2 hour part of the day and spent 100% of his time
playing videogames and daytrading. Another friend up and decided to go on a sabbatical, just
because he could.

I wanted to have more freedom. Engineers could work anytime, anywhere. As long as they output
code, they were good at their job. Unlike me, who had to turn up at 7:15 and beg managers
for handouts while they were actually in the office, and spend the rest of the time pleasing
my own managers and their arbitrary KPI gods.

I wanted more money.

I wanted a job where I could create stuff.

When I got laid off from the recruiting job (oil prices had dropped from 100 to 40$ a barrel and
I hadn't made a placement in 5 months), I
blitzed what little savings I had on a motorcycle trip across Vietnam. While there, I met
a couple digital nomads, including one in my short stay in Taiwan that told me about
programming bootcamps. I had also applied to, and had gotten into, a Master's in Computer Science
program in Taiwan at the time, and had considered that route as well, but that would
have taken 3 years and required me making up a bunch of math classes. A coding bootcamp
only took 3 months, though, and some had crazy guarantees like not charging until
you get your first job, or their fees being a percentage of your first year's salary,
that sort of thing. Sounded accessible! Sounded possible!

## What Did it Take to Get Into a Coding Bootcamp

Step one for me was taking the Introduction to CS50x course at Harvard through EDX. I'd link to
it, but it changes every semester, so just duckduckgo it if you want to try it. I'd do videos
and example code on my Surface Pro 3 during my lunch break when I was a recruiter, and
also for an hour or so every afternoon. I wasn't a very good e-student, though. At least
this way I had a very basic idea of what programming looked like, even though it was in C.
I still had no concept of web development, or really what the different programming languages
and platforms were, or what they were used for. It may not have been entirely pointless. I think
I had a leg up on the other students during the bootcam, and also, my Makersquare interviewer
was impressed I had actually finished the course.

After my soul-searching trip across Vietnam, I came back to Houston, moved in with my girlfriend
at the time to cut my rent costs in half, and studied to get into a bootcamp. This is where
my web development journey really started. At the time, the best bootcamp was widely considered
to be Hack Reactor. They had a great deal of resources on how to get into their own bootcamp, which
I used to build out my self study curriculum. If you're looking into bootcamps, search the ones
you're considering for their pre-study curriculum, or email them.

I would wake up around 8, drive to the gym, work out, get home around 10, study until 12, eat,
study until 5, eat, then study for a couple more hours. I wasn't very focused, but I did invest
a lot of time.

First, I learned the basic syntax of Javascript on [Codecademy](https://www.codecademy.com/). Then,
I went through a couple chapters of [Eloquent Javascript](https://eloquentjavascript.net/). After
about 2 weeks of studying, I fired off applications to every bootcamp I could find. Many of them
are now closed, or I'd link to them. The two I was most interested in were Makersquare and
Hackreactor. Hackreactor interviewed me and rejected me. Their interview was basically to
implement a couple lodash/underscore functions in vanilla Javascript, including `_.each`,
`_.map_`, `_.filter_`, and `_.reduce_`. I think I failed around map or reduce. They also
had me talk a bit about the basics of arrays and objects. It was a very Javascript focused
interview, with no questions about CSS or HTML.

They recommended I learned more about callbacks and closures, and gave me two links that I
still give out regularly:

  * http://javascriptissexy.com/understand-javascript-callback-functions-and-use-them/
  * http://javascriptissexy.com/understand-javascript-closures-with-ease/

I would get extremely confused and tripped up by callbacks, I simply wasn't used to, or
capable of, thinking that way. I remember a lot of frustration, anger, literal hairpulling,
furious pacing, and a strong desire to put a fist through my laptop. I would get pinned
against a brick wall and then [ask questions on stackoverflow](https://stackoverflow.com/questions/34954347/using-reduce-to-build-a-filter-function-in-javascript),
feeling like that was somehow a failure because I couldn't figure it out on my own. Over
time, though, I improved. It was painful and slow. I had finally been accepted into a
couple bootcamps, but they were either not very popular, or brand new, and I was
putting off signing anything with them until after two final in-person interviews
I had scheduled at Hack Reactor and Makersquare.

My girlfriend and I moved to San Francisco, into a trailer in a trailer park on
top of a mountain in Daly City / Colma. It was a 3 bedroom 2.5 bath, shared with
two Chinese families, each with young, totally out of control children. It
was our only choice, and rent was still 900$ a month for the room. The day
after we moved in, I did a Hack Reactor interview, and failed. Everything was
pinned on my Makersquare interview, else I was looking at a commute to Oakland
or San Jose every day for the next 3 months.

My Makersquare interview was identical to my first one, so I breezed through
my first few questions. Lo and behold, though, I got tripped up
on `reduce`, despite implementing it from scratch probably a hundred
times after failing the first time. I think I was also given
some kind of off-the-books question. At the end of the interview, the interviewer
sat and considered for a while, and then said "You know what, I'm not supposed
to tell you this, but fuck it, you're my last interviewee for me while I'm working here,
so you're gonna get in."

That close. Skin of my teeth.

## What Did it Take to Survive a Coding Bootcamp

First, I had to pay them. At the time I think Makersquare (by then, owned by Hack Reactor)
was about 16 or 17,000$. I didn't have the cash about, so I got a loan through Earnest. I
remember there was some kind of confusion or drama between them and Makersquare about
getting a full loan, my earning ability, and credit score. That was another skin-of-my-teeth
moment that I only survived because whoever at Makersquare was handling my account
was just a nice person. If you're going through this process, apply maximum
Dale Carnegie energy at every opportunity.

I had also been accepted late, so I had to finish 6 weeks of pre-course work in, if I
remember correctly, one or two weeks. So, more 8 hour days of studying and programming,
scratching my head, and probably outright pilfering code from other students for
the various projects I had to get done. As I recall, I could have potentially "failed"
this step, forcing me to wait 3 months for another cohort. So, more days of endless
programming, except now to get to the gym I had to bike 1 mile downhill, then 1 mile
back up one, and when I was programming, it was with two small children bouncing into
the back of my chair occasionally.

One of the projects involved writing some kind of [Twitter "clone"](https://github.com/komali2/MKS-SF-twittler).
I remember being utterly baffled by the assignment, and just looking at everyone else's
code so I could figure out how to get started. This, of course, made me feel like
a failure, but I was determined to at the very least survive. At this point,
I'd pinned my entire future on getting through the bootcamp.

Once the program started up it was 8am - 8pm Monday through Friday, 8am - 5pm on Saturday.
It lasted 12 weeks, with a 1 week break in the middle (so 13 weeks total). We got a 1 hour
lunch on Tuesday, Thursday, and Saturday, and a 2 hour lunch on Monday, Wednesday, and Friday.
I had virtually no money at this point, so I'd wake up around 6:30, bicycle down our huge
mile-long hill, then bike another couple miles up steep hills to the bus stop in Daly City
that'd take me to Mission and 5th street downtown. I took the bus because I could get a 70$
monthly pass with unlimited rides on the bus. It was like 120$ for the BART one, and BART
was a further bike ride anyway.

At night it was the reverse, so I'd usually roll in at 10 or 11 and pass straight out. My
relationship suffered, and I had absolutely no time besides Sunday for any personal time.
Half of Sunday would also be spent doing laundry and mealprepping my lunches and dinners
for the week. I did a lot of baking, and started cranking out loaves of sourdough, so that
was kinda fun.

At the bootcamp itself, I liked to get in early to get some bonus study time in. Also,
they offered a free breakfast, and first in got the best choices for the bagels.
We'd start the day off with some kind generic programming problem,
similar to what you might find on Project Euler or any of the programming challenge websites.
Then we'd usually do an hour of classroom time learning some new concept, then an hour or so
of pair programming on an assignment, then lunch. I'd always pack a lunch because it was cheaper,
though students with cash didn't have a hard time finding good food in the area.
If it was a 2 hour lunch day, I'd jog over to the 24 Hour Fitness to get a quick lift in
before lunch. I rate this as one of the most important things to keeping my mental health and
focus up during the bootcamp.

Some of the students would be skeptical or challenge aspects of the course, like the
requirement for most programming to be paired, or some of the arbitrary or more
boring readings. I decided to settle in and "trust the system" to the utmost, which
I think was a good strategy that paid off. It let me focus on just learning the
material, without leaving me any room to spend energy or time questioning what was
happening, which would lead to demotivation.

During classes, I took handwritten notes on my Surface Pro 3. I found the ability
to quickly switch between different colored ink and highlighters extremely useful
in keeping my notes organized, and the notetaking itself kept me very focused.
I almost never went back and read through my notes, it was almost
entirely an in-the-moment exercise. Still, before the bootcamp, I had been a
dreadful student, pulling only a 3.4 GPA in an objectively easily Humanities
program in University. It was important to grab every advantage I could.

I found that asking a lot of questions during lectures really helped me learn.
I would think "how can I get my money's worth" whenever possible. I like that
question remove any fear of embarrassment I had - fuck it, if the other students
think I'm stupid, I don't care, I'm getting my 18,000$ worth out of this teacher.
Sometimes a lecture would devolve into a literal Q/A conversation between me and
a teacher. I think this was critical to me "getting" some concepts.
I'd never let myself walk out of a lecture with a thought of "whatever, I'll
just figure it out later," because I knew I wouldn't.

I maintained perfect attendance throughout the bootcamp. Some students would
regularly show up late, one of whom was kicked out for it. Others would leave
or check out early, and didn't do as well during the job search portion. I
think my regularreduceity contributed to me being selected to get hired as one of
the four students kept after as teaching assistants.

There were several group projects throughout the program. I learned that outright
copying an existing app was perfectly acceptable. We were there to learn to code
and to work on an engineering team, not to invent the next great app. There was
often friction in these groups, as everyone had a different reason for being at
the bootcamp, and a different expectation of how much effort they expected
to be putting into something like a group project. I found letting go of my ego
and focusing on ensuring the team walked out of the bootcamp with a solid project
on their resume helped me step out of the drama.

At the end of the bootcamp was an extensive job hunting exercise. [I've written extensively](https://blog.calebjay.com/posts/bootcamp-job-search/)
about how you should go about that process.
