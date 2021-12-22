---
title: "Making a Fullstack App in Typescript, Vue, Python, SQLAlchemy, and Google Cloud"
date: 2021-11-16T02:16:47-08:00
draft: false
categories: ['programming']
tags: ['open-source', 'personal-project', 'frontend', 'javascript', 'python', 'backend']
---

I had two weeks of nothing to do but sit in a hotel room when I got back to Taiwan in October, so I used the time to crank out a fullstack app. This is [in line](/posts/bootcamp-job-search/** with the advice I like to give new programmers: there's no better way to hone your skills than on an actual project. For me, it'd been a while since I'd done something fully on my own, making all decisions about technology and deployment, so I knew it was time for a refresher.

The app's code can be found [on Github](https://github.com/komali2/game-remix-guesser), and the app is deployed to [guessagame.dev](https://guessagame.dev/).


* The App
  * Technologies Used
* Structure
  * Backend
    * Technology
    * Database Models
    * Scraping Ocremix
    * API
  * Frontend
  * Deployment



# The App

My focus was more on brushing up on core technologies than it was about developing something wild, so I wanted to build something relatively simple. Something that could use an SPA ([Single-Page App](https://en.wikipedia.org/wiki/Single-page_application)) on the frontend, needed some sort of API so I could write a backend, and involved a database, so I could plug my API into a database. Then, I could play with the different sorts of deployment options for all three.

I keep a long list of project ideas in Google Keep notes and in a header item in my `projects.org` file, so I poked through there until I came across a good candidate:

```org
** DONE Ocremix random guessing game
```
"Done" now because, of course, the project is no longer an idea.

In short, one time Tammy and I had been hanging around a computer. She was playing random video game music, and I was guessing the game the song was from. I thought it would be cool to make it into a game, but pull the music off [Ocremix](https://ocremix.org/), a videogame music remix website, to spice the game up a bit.

The app is deployed at [guessagame.dev](https://guessagame.dev/). At writing it's a functional work in progress, though there's much remaining that I want to do. It looks like this, when playing:


{{< img src="game.png" alt="Screenshot of the game." >}}

## Technologies Used

Quick list of the tech used, as my blog is partially my resume. Links navigate to a list of any articles I've written about that technology.

Typescript, [Javascript](/tags/javascript), [Python](/tags/python), [Vue](/tags/vue), SQLAlchemy, Mysql, Docker, Node, Fastapi, Selenium, Uvicorn, Beautifulsoup, and NES.css.


# Structure

## Backend

I chose Python for the API because while I'd worked on plenty of Python backends at Potato, I'd never built one out on my own. The backend would need to do several things:

1. Scrape Ocremix to get a Youtube URL for a song, as well as its associated videogame, the origin song, and the artist information.
2. Persist the above information in a database.
3. Generate "questions" and "answer choices" from the info in the database.
4. Serve a "game" API to the frontend, offering questions as well as a method to determine whether an answer is right or wrong.

### Technology

The Python backend uses Fastapi to manage the API. Pydantic and Sqlalchemy are used to structure the Models. Sqlalchemy is used to manage the Mysql database. Scraping Ocremix is done using Selenium and Beautifulsoup.

### Database Models

An SQL database with as many tables as I'm using is probably unecessary, not to mention deploying (expanded on later) to a Google Cloud Mysql instance, but I was interested in experimenting.

My data model looked something like this:


```text
                   Remix
              ↙            ↘
        Remix Artist     Original Song
                         ↙            ↘
           Original Song Artist     Original Song Origin Game
```

A "Remix" was the root of what I got from Ocremix. It would come from a URL like `https://ocremix.org/remix/OCR04259`, and luckily, all the information I needed to fill out the above models was available on the page. Remixes are unique, identifiable by that last part of the URL there, `OCR04259`. Remix Artists, Original Songs, Original Song Artists, and Original Song Origin Games *aren't* unique. So, while I could generate a new remix Model every time I scraped a page, I wanted to not duplicate any of the non-unique Models that already existed in the database. My thinking was, and is, that perhaps I can do something fun with these relationships in the future. For now, they're just a way to practice linking tables through foreign keys and join queries.

Because the "Remix" was what got scraped, my Model generation flow looked like this:

1. Check if a Remix already exists with this `Remix.ocremix_remix_id`, if so, return it and stop. If not, go to 2
2. Collect all Remix, Remix Artist, Original Song, Original Artist, and Videogame information
3. Check if a Remix Artist already exists with this `remix_artist_name`. If not, create it.
4. Check if an Original Song already exists with this `original_song_title`. If not, create it.
5. Check if a Videogame already exists with this `videogame_title`. If not, create it.
6. Establish necessary relationships between all of the above.

A Remix has a relationship with a Remix Artist, and Original Song, an Original Song has a relationship with an Original Song Artist and Original Song Origin Game, so I couldn't consider a Remix model "complete" until step 5 above had completed.

The functionality is captured in `/backend/app/crud.py`:

```python
def deep_create_remix(
        db: Session,
        remix: schemas.RemixCreate,
        remix_artist: schemas.RemixArtistCreate,
        remix_original_song: schemas.OriginalSongCreate,
        original_artist: schemas.OriginalArtistCreate,
        videogame: schemas.VideogameCreate):

    remix_artist_db = get_remix_artist_by_name(db, remix_artist['remix_artist_name'])

    if remix_artist_db is None:
        remix_artist_db = create_remix_artist(db, remix_artist)

    remix_original_song_db = get_original_song_by_title(db, original_song_title=remix_original_song['original_song_title'][0])

    if remix_original_song_db is None:
        remix_original_song_db = deep_create_original_song(db, remix_original_song, original_artist, videogame)

    return create_remix(db, remix, remix_artist_db.id, remix_original_song_db.id)

```


### Scraping Ocremix

### API

I dabbled with a couple ideas of how the API should work, including ones that tracked game "sessions," or in other words maintained an idea of frontend state. This turned out to be probably kinda hard to implement, even though I had done something like this with websockets on a [super old projects in my bootcamp days](https://github.com/komali2/langBattle). Instead, I wanted a way for the frontend to just get a "question" (a youtube link) and some possible "answers," one of which was correct. I could obviously just send all this information to the frontend, including which answer was "correct," and then not display it in a way that allowed cheating on the frontend, but someone could peek at the network requests and cheat that way! No, I had to make sure it was impossible to cheat using my API (unless, of course, one simply navigated to the youtube URL manually and read the game information).

It took some gnawing on the idea, but I settled on to what my understanding is basically a rudimentary implementation of a public/private key pair.

It works like this:

A request to get a "question" would return

```json
{
  choices: [
    {
      origin_game: 'Some game',
      public_id: 'some id'
    },
    ...x4
  ],
  question: {
    remix_youtube_url: 'https://youtube.com/somesong',
    secret_id: 'some id'
  }
}
```

The user would see four game titles, and when they chose one, they'd send another request with that game's `public_id`, as well as the `secret_id` of the "question," the object with the youtube url.

On the backend, I'd simply query for any model with that public and secret id.

```python
def match_public_id_to_secret_id(db: Session, public_id: int, secret_id: int):
    return db.query(models.Remix).filter(and_(models.Remix.secret_id == secret_id, models.Remix.public_id == public_id)).first()
```

If I found a result, the choice was correct. Otherwise, it's incorrect.

## Frontend

## Deployment
