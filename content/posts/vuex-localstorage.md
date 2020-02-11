---
title: "Saving Vuex State to localStorage"
date: 2020-01-28T02:16:47-08:00
draft: false
categories: ['programming']
tags: ['vue', 'javascript', 'frontend']
---

If you're using Vue and Vuex and want to perpetuate data between refreshes or
when your user closes the session and returns later, a good way to do so without
invoking an API is to use localStorage.

localStorage is a fairly universal browser API for saving data across sessions.
Ther is no expiration time, unlike sessionStorage, so technically localStorage
data can stay there indefinitely. Read more on usage on [MDN](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage).


Below I will illustrate a way to make every state change to the Vuex store be
persisted against localStorage, and ensure that the store is set based off
localStorage when the app loads after a refresh.

This article assumes you are using [Vuex](https://vuex.vuejs.org/).

Assume your store looks something like:

```
import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    score: 0,
    enemiesKilled: [],
    health: 5,
  },
})
```

Whenever a mutation or action changes `state.score`, you want that to save to
localStorage. You can hook into every single state change with `store.subscribe`.
Vuex documentation on the method can be found
[here](https://vuex.vuejs.org/api/#subscribe).

The idea is, on every mutation, save the entire store to localStorage.

```
store.subscribe((mutation, state) => {
  if (state) {
    localStorage.setItem('state', JSON.stringify(state));
  }
});

```

Obviously, the state should be stringified before saving, as localStorage
only accepts strings for keys or values.

If you only want certain keys in your store to be saved, you can use a lodash
function or similar:

```
store.subscribe((mutation, state) => {
  if (state) {
    const storageSafe = _.pick(state, [
      'enemiesKilled,
      'health
    ]);
    localStorage.setItem('state', JSON.stringify(storageSafe));
  }
});
```

In the above example, only `enemiesKilled` and `health` mutations will be
persisted against localStorage.

That takes care of saving, now you need to ensure that on page load, your app
sets its store to be equal to data saved in localStorage.

The function you'll use to do this is `store.replaceState`, and you can find
the documentation [here](https://vuex.vuejs.org/api/#replacestate).

You need to invoke this fairly early in your app's rendering process. I prefer
to do so in the root Vue component's `created` hook, invoking an action that
will invoke `replaceState`.

In my store:

```
import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    score: 0,
    enemiesKilled: [],
    health: 5,
  },
  actions: {
    initializeStore({ state, }) {
      if (localStorage.getItem('state')) {
        this.replaceState(
          Object.assign(state, JSON.parse(localStorage.getItem('state')))
        );
      }
    },
  },
});
```

Of course, since the state has been stringified in localStorage, it must be
parsed by `JSON.parse()`.

Here's the action being invoked on my root Vue component:

```
<template>
  <div id="app">
  </div>
</template>

<script>

export default {
  name: 'app',
  created() {
    this.$store.dispatch('initializeStore');
  },
};
</script>

```

It's my goal to write READMEs and other instructive articles as clearly as
possible. If there's anything above that you didn't understand or didn't work
for you, please email me at rogersjcaleb on the Google email service so that I
can help you and then improve my post for others.
