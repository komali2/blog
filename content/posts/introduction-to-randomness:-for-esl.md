---
title: "Introduction to Randomness: For ESL"
date: 2017-10-26T03:52:29-8:00
draft: true
categories: []
tags: []
---

This is a paraphrasing of "Introduction to Randomness and Random Numbers," by Dr Mads Haahr, originally published on https://www.random.org/randomness/ , as retrieved on 10-25-2017. All credit for original article is due to Dr. Haahr, I simply did this because I've noticed the article is assigned en masse by introduction to computer science professors to students who struggle with the concepts merely because the article is written in academic English.

Begin:

Introduction to Randomness and Random Numbers

<a href="http://www.learnersdictionary.com/definition/random">Random</a> -  <span class="def_text">chosen, done, etc., without a particular plan or pattern. Here's a <em class="mw_spm_it">random</em> sequence of letters: "B, X, Z, P, A, D, L."</span>

This article is about why it is hard for a computer to make a random sequence of letters, like I did above.

Computers need to make random numbers for many reasons. Some of the reasons are: generating <a href="https://en.wikipedia.org/wiki/Key_(cryptography)">encryption keys</a> (used to keep passwords safe, for example), or, rolling dice in video games.

Think about a a <a href="https://diceemporium.com/wp-content/uploads/2016/11/white.jpg">6-sided die</a>. If you throw this die, it will land on a single number between 1 and 6. Because each number, between 1 and 6, was <em>equally likely</em> to be chosen, we call this concept "<a href="http://en.wikipedia.org/wiki/Uniform_distribution_%28discrete%29">uniform distribution.</a>" There was a 16.66...% chance you would choose 1, a 16.66...% chance you would choose 2, and etc. In order for something to be "random," it must have "uniform distribution."

Uniform distribution is necessary for something to be considered "random," and also "<a href="http://en.wikipedia.org/wiki/Statistical_independence">statistical independence</a>" is necessary. If you roll a die and it lands on "4," the probability for it to land on "4" has not changed. It is still 16.66...% likely to land on 4 on the next throw. This is called "statistical independence."