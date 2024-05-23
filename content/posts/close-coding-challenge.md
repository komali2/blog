---
title: 'A Simple React Challenge'
date: 2024-04-24T20:57:00.004-05:00
draft: false
categories: ['programming']
tags: ['react', 'javascript', 'job-hunt']
---

Close had for their job application on Wellfound a coding challenge. I'm slightly miffed that they
ask someone to write code without even screening them first to see if they believe on the surface I'm a
good fit for the position, so, I'll use it as an opportunity for a blog post.

This is the [ original jsfiddle ](https://jsfiddle.net/mladylukas/9qmusLok/), and this is [my solution fork](https://jsfiddle.net/calebjay/tzjrq6sx/14).


# The Problem

A very simple click handling problem.

*HTML*

```html
<div id="root"></div>
```

*CSS*
```css
.List {
  margin: 16px;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
  grid-auto-rows: 60px;
  grid-gap: 16px;
}

.List__item {
  line-height: 60px;
  text-align: center;
  color: white;
  text-shadow: 1px 1px rgba(0, 0, 0, 0.5);
  box-shadow: 0px 1px 1px 0px rgba(0, 0, 0, 0.05);
}
.selected {
  outline: 2px solid black;
}

/* Taken from https://clrs.cc/ */

.List__item--navy {
  background-color: #001f3f;
}

.List__item--blue {
  background-color: #0074d9;
}

.List__item--aqua {
  background-color: #7fdbff;
}

.List__item--teal {
  background-color: #39cccc;
}

.List__item--olive {
  background-color: #3d9970;
}

.List__item--green {
  background-color: #2ecc40;
}

.List__item--lime {
  background-color: #01ff70;
}

.List__item--yellow {
  background-color: #ffdc00;
}

.List__item--orange {
  background-color: #ff851b;
}

.List__item--red {
  background-color: #ff4136;
}

.List__item--maroon {
  background-color: #85144b;
}

.List__item--fuchsia {
  background-color: #f012be;
}

.List__item--purple {
  background-color: #b10dc9;
}

.List__item--black {
  background-color: #111111;
}

.List__item--gray {
  background-color: #aaaaaa;
}

.List__item--silver {
  background-color: #dddddd;
}
```

*JSX*
```jsx


const { Fragment, useState } = React;


// Implement a feature to allow item selection with the following requirements:
// 1. Clicking an item selects/unselects it.
// 2. Multiple items can be selected at a time.
// 3. Make sure to avoid unnecessary re-renders of each list item in the big list (performance).
// 4. Currently selected items should be visually highlighted.
// 5. Currently selected items' names should be shown at the top of the page.
//
// Feel free to change the component structure at will.
const List = ({ items }) => {
return (
  <Fragment>
    {selectedItems.join(', ')}

    <ul className="List">
      {items.map(item => (
          <li key={item.name} className={`List__item List__item--${item.color} `} >
              {item.name}
          </li>
      ))}
    </ul>
  </Fragment>
)};

// ---------------------------------------
// Do NOT change anything below this line.
// ---------------------------------------

const sizes = ['tiny', 'small', 'medium', 'large', 'huge'];
const colors = ['navy', 'blue', 'aqua', 'teal', 'olive', 'green', 'lime', 'yellow', 'orange', 'red', 'maroon', 'fuchsia', 'purple', 'silver', 'gray', 'black'];
const fruits = ['apple', 'banana', 'watermelon', 'orange', 'peach', 'tangerine', 'pear', 'kiwi', 'mango', 'pineapple'];

const items = sizes.reduce(
  (items, size) => [
    ...items,
    ...fruits.reduce(
      (acc, fruit) => [
        ...acc,
        ...colors.reduce(
          (acc, color) => [
            ...acc,
            {
              name: `${size} ${color} ${fruit}`,
              color,
            },
          ],
          [],
        ),
      ],
      [],
    ),
  ],
  [],
);

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <List items={items}/>,
);
```

# The Solution

Pretty straightforward. Create a class that outlines a list element, apply it on click, and also track the names of clicked list items.
I was going to be funny and use the `classlist` property of DOM nodes and ignore react entirely but since I also needed to track the clicked names, there wasn't really a way around needing a `useState**.

For the CSS, I just added a single class:

*CSS*
```CSS
.selected {
  outline: 2px solid black;
  border: 2px solid white;
}
```

Just make it bright and visible. No time for making things pretty when I'm not even at a post-screening call stage.

For the JSX, I needed some state tracking and function handling per list item, so I pulled it into a component.
Then, to track which names are clicked, I passed in a function from the parent component, to be invoked on child click.
I just stuck the selected names array at the top rather than doing a pretty `map` with divs and whatnot because, again, pre-screen lol.

I did get to learn about `toSpliced` which I didn't know about, glad we have that (now?) so we can splice in situations we don't want to
mutate arrays, which is basically always when dealing with frameworks that have state management tools tied into render logic.

*JSX*
```JSX
const ListItem = ({item, announceSelected}) => {
  const [isSelected, setSelected] = useState(false);
  const handleClick = () => {
    announceSelected(item.name, isSelected)
    setSelected(!isSelected);
  };

  return (
        <li key={item.name} className={`List__item List__item--${item.color} ${isSelected ? 'selected' : null}`} onClick={handleClick}>
          {item.name}
        </li>
   );
}
const List = ({ items }) => {
    const [selectedItems, setSelectedItems] = useState([]);
    const handleAnnounceSelected = (name, remove) => {
    if (remove) {
    const arr = selectedItems.toSpliced(selectedItems.indexOf(
        name
    ), 1)
    setSelectedItems([...arr]);

    } else {
  	    setSelectedItems([...selectedItems, name]);
    }
}
return (
  <Fragment>
    {selectedItems.join(', ')}
    <ul className="List">
      {items.map(item => (
				<ListItem item={item} key={item.name} announceSelected={handleAnnounceSelected} />
      ))}
    </ul>
  </Fragment>
)};

```
