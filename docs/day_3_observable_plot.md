# Day 3: Charts with Observable Plot

> **Visualization path.** Yesterday you drew a bar chart by hand and felt how much bookkeeping it takes. Today you get that time back. Observable Plot is built by the same team as D3 and sits on top of it — a chart that takes fifty lines of D3 takes one or two here. You will build real charts today, on day two of writing JavaScript.

## 🎯 Learning Objectives
By the end of this day, you will:
- Explain marks, scales, and channels — the grammar Plot is built on
- Load a CSV and render bar, line, and scatter charts from it
- Control axes, labels, colors, and sorting deliberately rather than by default
- Facet one chart into a small-multiples grid
- Embed a Plot chart into a plain HTML page you serve yourself

## 📝 Key Concepts

### 1. Why a grammar, not a chart type
- [Why Plot?](https://observablehq.com/plot/why-plot)
- [Plot: What are marks?](https://observablehq.com/plot/features/marks)

If you come from Power BI, the mental shift is this: you are no longer picking a chart from a gallery. You are declaring *which visual property encodes which column* — x, y, color, size. "Bar chart" is the result, not the request.

### 2. Marks
- [Plot: Bar](https://observablehq.com/plot/marks/bar) · [Line](https://observablehq.com/plot/marks/line) · [Dot](https://observablehq.com/plot/marks/dot) · [Rule](https://observablehq.com/plot/marks/rule)

### 3. Scales and channels
- [Plot: Scales](https://observablehq.com/plot/features/scales)
- [Plot: Color scales](https://observablehq.com/plot/features/scales#color-scales)

### 4. Transforms
- [Plot: Group transform](https://observablehq.com/plot/transforms/group)
- [Plot: Sort transform](https://observablehq.com/plot/transforms/sort)

### 5. Getting data in
- [D3: `d3.csv`](https://d3js.org/d3-fetch#csv) — Plot uses D3's loaders
- [MDN: `fetch`](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch)

## 💻 Practice Exercises

### Exercise 1: Hello, Plot
#### Deliverables
1. A served HTML page that loads Plot and renders a bar chart of the same five values from Day 2: `[12, 30, 8, 45, 22]`.
#### Success Criteria
- The chart renders with axes you did not have to draw
- The file is meaningfully shorter than your Day 2 hand-built version
#### Hints
- Start from the CDN import shown in Plot's getting-started page — no build tooling today
- `Plot.barY(data).plot()` returns a DOM node; you have to append it to the page yourself
#### Resources
- [Plot: Getting started](https://observablehq.com/plot/getting-started)

### Exercise 2: Real data, three marks
#### Deliverables
1. Load [`../data/titanic.csv`](../data/titanic.csv) and render three charts from it: a bar, a line or area, and a scatter.
#### Success Criteria
- All three read from the same loaded dataset
- Each axis is labeled in words a non-analyst would understand
- Numeric columns parse as numbers, not strings
#### Hints
- CSV values arrive as strings. Look up `d3.autoType`.
- If a bar chart shows one giant bar, you are missing an aggregation — see the group transform
#### Resources
- [Plot: Bar](https://observablehq.com/plot/marks/bar)
- [D3: `autoType`](https://d3js.org/d3-dsv#autoType)

### Exercise 3: Make deliberate choices
#### Deliverables
1. Take your bar chart and: sort bars by value descending, set an explicit color, label both axes, and add a title.
2. Write two sentences on why you chose that sort order.
#### Success Criteria
- Nothing in the chart is left at a default you cannot justify
- The sort is done in the chart spec, not by pre-sorting the array
#### Hints
- Plot's `sort` option accepts a channel name — read the sort transform docs before hand-rolling it
#### Resources
- [Plot: Sort transform](https://observablehq.com/plot/transforms/sort)
- [Data to Viz: choosing a chart](https://www.data-to-viz.com/)

### Exercise 4: Small multiples
#### Deliverables
1. Facet one of your charts into a grid using a categorical column.
#### Success Criteria
- Each panel shares a common scale, so panels are visually comparable
- Panels are labeled
#### Hints
- Look up `fx` and `fy` in Plot's facet documentation
- If each panel has its own y-axis range, the comparison is broken — find the option that fixes it
#### Resources
- [Plot: Facets](https://observablehq.com/plot/features/facets)

### Exercise 5: Ship it into a page
#### Deliverables
1. A single self-contained `index.html` that loads the CSV, renders two of your charts side by side, and works when served locally.
2. A short `README.md` explaining how to run it.
#### Success Criteria
- Opening the served page shows both charts with no console errors
- The page still works after a hard refresh with cache disabled
- Someone else could run it from your README alone
#### Hints
- Charts must render *after* the data resolves — this is the first place `async`/`await` will bite you
- Watch the console; a silent blank page is almost always a failed fetch or a null container
#### Resources
- [MDN: `async`/`await`](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Promises)

## 🔍 Validation Checklist
Before proceeding to the next day, verify:
- Plot renders from a CDN import on a page you serve
- Three mark types render from one real dataset
- Numbers parse as numbers and axes are labeled in plain language
- One chart is faceted with shared scales
- A self-contained page renders two charts with no console errors
- You can explain what a *mark* is and what a *channel* is without reading from the docs

## ⏱️ Time Estimate
4–5 hours. Exercises 1–3 are the core; 4 and 5 are where it becomes a thing you could put on a website.

## ➡️ What's next
Plot covers most standard charts. The next day takes a chart you have already built here and rebuilds it in D3 — so that when you hit something Plot cannot express, you know what to reach for and why.
