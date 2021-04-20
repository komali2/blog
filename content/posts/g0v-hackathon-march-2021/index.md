---
title: "g0v Hackathon in Taiwan"
date: 2021-03-30T02:16:47-08:00
draft: false
categories: ['programming']
tags: ['taiwan', 'hackathon', 'open-source', 'g0v']
---

This March I attended a g0v hackathon. g0v holds these hackathons every 2 months to give the entire
g0v community a chance to regularly meet, as well as to allow newbies, such as me, an opportunity
to get introduced to g0v and find ways to contribute.

[g0v](https://g0v.tw/) is a civic community here in Taiwan, founded by hackers and
backed by Digital Minister Audrey Tang.
The community is a mechanism to act on the value system Audrey Tang is implementing into the government.
This value system is shared with many people here in Taiwan as well as internationally, and so there are
a great many volunteers working to improve Taiwan through g0v. Concepts such as Open Source / Libre,
radical transparency, sustainability, and equity are all ideals that are being promoted through g0v.

I had a really wonderful time at the hackathon, and it further cemented for me that moving to
Taiwan was a fantastic idea, and that I should stay here for as long as I possibly can.

This hacakthon wasn't a competition type one, with prizes at the end. Instead, it was a place where
long-term projects recruited new members, and new projects were pitched. It was very similar to the
regular Code for San Francisco meetups I had been to in the past, where groups worked on various
open source projects to improve their city, country, or world.

In the lead-up to the hackathon there had been some discussion on the g0v slack of working on improving
the gold card application website as a hackathon project, but I'm glad that fell through, as coming
with no project and really no expectations seemed to be the best possible way to come to the hackathon.
My Mandarin speaking
ability isn't great right now, so I went in with a plan to simply lend my engineering abilities wherever
I could to help however I could.

Luckily, g0v is practiced at accommodation. At the entrance was a booth to sign in. After signing in,
I was given a name tag and pointed to a box full of stickers that I could use to identify my skillset
as well as what type of topics I was interested in. The skill set stickers included things like Python,
Javascript, React, Full Stack, Vue, Android, Photography, and Data Science. The interests stickers included topics such as Environmentalism,
Intellectual Property, Nuclear, and Radio. I grabbed Environment, Full Stack, CSS, HTML, Javascript, React,
and Python, and then simply wandered around.

{{< figure src="namecard.jpg" alt="My namecard, with 'Caleb' written on it, as well as stickers identifying my skills stuck to it." caption="My namecard!" >}}

{{< figure src="stickers.jpg" alt="Boxes of stickers identifying various skills and interests." caption="The boxes with various stickers." >}}

Almost immediately, a person introduced themselves to me that recognized me from my slack profile picture.
They chatted with me a bit about what was happening and what to expect, and let me know that projects
would be pitching in the main hall soon. From them, I understood that I could listen to some pitches,
and then decide which project I wanted to join and work on that day. So, I sat down in the little
auditorium. Of course, the presentations were given in Mandarin, but after a few minutes another person
came and asked if I could use a translation, and then sat next to me and translated each presentation
word for word. As you might guess, this is an exhausting thing to do, but they did it without hesitation.
As an immigrant, I feel it's more my responsibility to learn the local language than it is for locals
to accommodate my lack of Mandarin ability, so I'm always very grateful when someone is willing to translate
for me. At least 18 projects presented, and each had three minutes to present, so
it was a lot of translating to do.

{{< figure src="translating.jpg" alt="A person helping translate for another person." caption="There were many people helping translating." >}}

{{< figure src="cofacts.jpg" alt="The cofacts project presenter, presenting." caption="The cofacts presenter had on an interesting harajuku style outfit." >}}

{{< figure src="disfactory.jpg" alt="The disfactory project presenter, presenting." caption="The presenter of disfactory, the project I ended up joining." >}}

The projects were much more robust than I was expecting, based on my civic hack experience. In San Francisco,
projects were usually just cobbled together messes of hundreds of React libraries and example code that resulted
in, like, an embedded Google map or something. Below are some of the projects I found really interesting:

* Generating ADHD resources for Taiwanese people
* Tracking social attacks on Taiwan by China
* Creating and curating a database of food products in Taiwan shops, and how green the company is that makes said products
* Photo-mapping before and after results of natural disasters in Taiwan
* Reporting, mapping, and generating paperwork for the government tracking of illegal factories throughout Taiwan
* A web-based dictionary for a native Taiwanese language (presentation given in said language)
* A relatively well-known project for fighting misinformation in Taiwan (a constant threat due to Chinese social engineering)
* Decentralizing information and fighting fake news in Hong Kong

After the presentations, the team leaders for each project found a nook in the building to hide out in and posted
a label with their team name. I sought out [Disfactory](https://disfactory.tw/),
the project about reporting and tracking illegal factories,
because I liked the environmentalist cause, and because the AQI has been terrible lately, and also because the
frontend is in Vue which I am very familiar with.

At the Disfactory table was just one person, apparently a backend engineer. I spoke with them a bit in my not too great Mandarin,
and they pointed me towards the Github and the slack channel. I simply sat down, cloned the repo, and started poking around.
Eventually more members of the team showed up, including the person that had helped me as soon as I walked in to the hackathon!
Very fortunate coincidence. Their English was much better than my Mandarin, so they all started helping me get sorted, getting me
added to the Github organization and the like.

{{< figure src="working.jpg" alt="The room many teams were working in, filled with people working." caption="A room filled with people hard at work." >}}
{{< figure src="calebworking.jpg" alt="My team and I working." caption="My team and I puzzling over some problem." >}}

As I was poking around [the code](https://github.com/Disfactory/frontend)
I was struck by how well written it was for work that was essentially done for free. That was
a theme for my thoughts throughout the day. Taiwan work culture emphasizes long hours for very noncompetitive pay, to the point
that people are willing to risk a life of social oppression in China just for a reasonable salary. In spite of that,
everyone at the hackathon was giving one of their only days off to a social cause, on top of all the time they dedicate
throughout the week to the project itself. We're talking 10 hours a day, 5-6 days a week as a norm for their day jobs.
Meanwhile I'm sitting
pretty with my on-and-off contracting work, not really making much of a sacrifice at all by being there. More than ever
I felt obligated to give back as much as I could to Taiwan for the opportunities afforded to me by being here. Though,
when pressed on the subject, many people told me it was also a great way to hang out with friends.

We got some basic github tickets assigned to me around accessibility, button names and labels, that kind of thing. Within an
hour or so I had my first pull request accepted and merged, which feels great. Who doesn't love having their name attached
to something really cool? After that I got started on a trickier problem involving clustering together map pins, as their
map had thousands of factories all represented as pins, and it made for a messy UI.

Time went by quickly, and every once in a while some food would be put out in the main area. The first round was some
noodles and other vegetarian dishes, which I'm not sure but appeared to be unexpected to many people there, who had
been wryly describing g0v as "an institution that allows you to eat fried chicken and pizza with your friends" to me
for the last few hours. Lo and behold, an hour or so after noodles, boxes of pizza and buckets of chicken arrived,
and one of my teammates told in and told us to hurry because they believed it would all "disappear in minutes."

{{< img src="food1.jpg" alt="People acquiring pizza." >}}

{{< mg src="calebfood.jpg" alt="Me being excited about pizza.">}}

{{< figure src="dessert.jpg" alt="A table of desserts." caption="They also had dessert!" >}}

While hanging out and eating, I had some really cool conversations with various people involved in g0v, including
some people involved with the Gold Card office and the immigration agency. Even though fixing the gold card application website in one
fell swoop at a hackathon was out of the picture, it was really cool to get insight straight from what I believe was
a government employee at what is going on behind the scenes. Taiwanese web infrastructure is a really interesting amalgamation
of the absolutely worst web engineering I've ever seen in my life
(for example, the [Gold Card application website](https://coa.immigration.gov.tw/coa-frontend/four-in-one/entry/golden-card))
and some
of the best engineering I've ever seen (for example, [the Gold Card FAQ and general information website](https://goldcard.nat.gov.tw/en/)).
In the case of the
gold card, this may be attributed to the fact that one website was made by the immigration office and the other by
the made-for-purpose gold card office.

Anyway, after eating I plugged away at my little assigned task, and actually managed to get the pins to cluster, albeit without
any click handling functionality. Someone on my team asked to see, said, "cool!" and then asked if I'd be ready to present it to
the hackathon in 5 minutes. I didn't realize we were already at the end of the day. My team and I got everything sorted for a demo,
and just about 15 minutes later I was fumbling through a sentence of broken Mandarin in front of an audience of about 50 before
my teammate thankfully took over the explanation of our work while I zoomed around the map showing off our awesome pin clusters.

{{< img src="presenting.jpg" alt="My teammate and I presenting our project."  >}}

Once again, someone came and translated all of the presentations to me, this time my teammate.
Many projects went out of their way to present tasks that didn't require engineering skills to solve. One such project was
simply a Google form collecting people's methods for describing g0v to their friends and family, which as I demonstrated
in the first paragraph of this blog post, is remarkably difficult to do. I had some great insight to how Taiwanese people
think of this project in the context of their own culture. For example, a lot of answers, particularly ones with a family
member audience, went to great lengths to describe how g0v wasn't "political" in nature, which I was told is an attempt
to assure family members that the g0v contributor isn't sticking their necks out too far. From what I can tell, there is
still a conservative bloc among the older generations that has been preaching a lifestyle of simplicity and safety. The
"get a job, buy a house, have 2.5 kids" party, basically. This is at odds with what I've been seeing in meeting active
civic participants, which kicked off during my first stay in Taiwan in 2014 when Taiwanese students
[occupied their Legislative Yuan](https://en.wikipedia.org/wiki/Sunflower_Student_Movement),
what we might think of as Congressional Chambers in the USA, to protest against a bill that would give China undue
ability to economically pressure Taiwan. So even if g0v isn't inherently political, it seems to me that the young
people in Taiwan are, and that so many are willing to give their time to g0v for free could be an indication for a desire
for a high level of civic involvement by young Taiwanese people.

At the end of the hackathon, a good deal of us went out for dinner at a really cool restaurant that collects all sorts of
old objects. Tammy met up with us and good conversation abounded. The g0v people were really open to talk about pretty
much anything, and we learned a great deal about Taiwanese culture that night.

I was really impressed by the entire experience, and it was a mightily positive experience at that. Now, I meet weekly with
my disfactory team at a local NGO office, and they remain just as cool during the week as they were during the weekend. I'm
really looking forward to getting even more involved with g0v. Whether you're in Taiwan or not, I recommend looking into
g0v, and in particular I recommend forking projects such as [cofacts](https://cofacts.tw/) for your own country. Furthermore,
feel free to chat with g0v participants on their [slack](https://join.g0v.tw/)!
If you are
here, feel free to email me at caleb @ this domain dot com if you have any questions or want some help getting involved.
