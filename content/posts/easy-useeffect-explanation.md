---
title: 'Easy Explanation of React UseEffect'
date: 2022-06-09T20:24:00.001-05:00
draft: false
categories: ['programming']
tags: ['react', 'javascript', 'frontend']
---

Maybe I'm dumb, but I find React / Redux world to be full of just about the most difficult to understand documentation and tutorials I've seen. I was looking up state management for React, which is now Too Good for straightforward component lifestyle update methods like `onComponentMount` or whatever, and found [this Stackoverflow answer](https://stackoverflow.com/a/57382170/2590119) that spelled out React Hooks' `useEffect` update cycle as clearly as is possible.

In short, if I have the following code:

```typescript
const SomeComponent = () => {
    const [userInput, setUserInput] = useState('');

    useEffect( () => {
        fetch('example.com/take-input', {method: 'POST', body: {userInput}});
    });
}
```

I want to hit the API with a POST every time the user input updates, but I was getting confused because documentation describes `useEffect` as a "replacement" for component lifestyle methods. They are, apparently, but they're also supposed to be used as the way to respond to component state management. So, as per the dead simple StackOverflow answer, here's how these four `useEffect` implementations will behave:

1. Will run only once, when the component mounts for the first time: empty dependencies array. This won't behave as I intend, as it won't update when `userInput` updates.

```typescript
const SomeComponent = () => {
    const [userInput, setUserInput] = useState('');

    useEffect( () => {
        fetch('example.com/take-input', {method: 'POST', body: {userInput}});
    }, []);
}
```

2. Will run when the component mounts for the first time, and, whenever *any* component state changes. Not exactly what I want, as I don't want changes to other state declared with `useState` to run my `POST` api call. This is achieved by passing nothing as the second argument to `useEffect`.

```typescript
const SomeComponent = () => {
    const [userInput, setUserInput] = useState('');

    useEffect( () => {
        fetch('example.com/take-input', {method: 'POST', body: {userInput}});
    });
}
```
3. Will run when the component mounts for the first time, and, when `userInput` state changes: pass `userInput` in to the `useEffect` dependencies array.

```typescript
const SomeComponent = () => {
    const [userInput, setUserInput] = useState('');

    useEffect( () => {
        fetch('example.com/take-input', {method: 'POST', body: {userInput}});
    }, [userInput]);
}
```
