# Day 2: Web Fundamentals & SVG

> **Visualization path.** This is your first day after the shared foundation (Day 0, Day 1). If you came here from a BI tool like Power BI or Tableau, this day covers the ground those tools hid from you. Every charting library on the web draws into SVG — so before you can control a chart, you need to be able to read the thing it draws.

## 🎯 Learning Objectives
By the end of this day, you will:
- Structure a page with HTML and select elements with CSS
- Explain the SVG coordinate system and why its origin is top-left
- Draw and position shapes by hand in raw SVG
- Read an existing chart's SVG in browser DevTools and identify which element draws which mark
- Serve a local page and inspect it

## 📝 Key Concepts

### 1. HTML structure
- [MDN: HTML basics](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/HTML_basics)
- [MDN: Document structure](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/Document_and_website_structure)

### 2. CSS and selectors
- [MDN: CSS first steps](https://developer.mozilla.org/en-US/docs/Learn/CSS/First_steps)
- [MDN: CSS selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Selectors) — selectors matter more than styling here; libraries target elements the same way

### 3. SVG — the drawing surface
- [MDN: SVG tutorial](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial)
- [MDN: Positions and the coordinate system](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Positions)
- [MDN: Basic shapes](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Basic_Shapes)
- [MDN: `viewBox`](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/viewBox) — the single most confusing SVG attribute, and the one that makes charts responsive

### 4. Browser DevTools
- [Chrome DevTools: Inspect the DOM](https://developer.chrome.com/docs/devtools/dom)

## 💻 Practice Exercises

### Exercise 1: A page you can serve
#### Deliverables
1. An `index.html` with a heading, a paragraph, and a linked stylesheet.
2. The page served over `http://localhost`, not opened as a `file://` path.
#### Success Criteria
- The page renders your styles in a browser
- You can explain why later exercises will *require* a local server rather than a double-clicked file
#### Hints
- `python -m http.server` is already available from Day 0
- The `file://` question is about browser security policy — search for "CORS fetch local file"
#### Resources
- [MDN: How do you set up a local testing server?](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/Tools_and_setup/set_up_a_local_testing_server)

### Exercise 2: Draw a bar chart with no library
#### Deliverables
1. An inline `<svg>` containing five `<rect>` elements whose heights encode these values: `[12, 30, 8, 45, 22]`.
2. A baseline axis line and a text label under each bar.
#### Success Criteria
- Bars sit on a common baseline and grow upward
- The tallest bar is the value 45
- Nothing is clipped at the edges of the `<svg>`
#### Hints
- SVG's y-axis increases *downward*. Growing a bar upward means computing `y` as `chartHeight - barHeight`. This inversion is the reason chart libraries exist — sit with it for a few minutes rather than rushing past it.
- Give the `<svg>` an explicit `width` and `height` first; add `viewBox` after it works
#### Resources
- [MDN: `<rect>`](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/rect)
- [MDN: `<text>`](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/text)

### Exercise 3: Read someone else's chart
#### Deliverables
1. Open any published web chart in DevTools and write a short note (5–10 lines) identifying: what element wraps the plot area, what element draws a single data mark, and how the axis labels are rendered.
#### Success Criteria
- You can point at one DOM node and say "this is one data point"
- You can name at least one thing the library did that you did by hand in Exercise 2
#### Hints
- [The Pudding](https://pudding.cool/) and [Our World in Data](https://ourworldindata.org/) both publish inspectable SVG charts
- Right-click a bar or dot → Inspect
#### Resources
- [Chrome DevTools: Inspect the DOM](https://developer.chrome.com/docs/devtools/dom)

### Exercise 4: Make it responsive
#### Deliverables
1. Return to your Exercise 2 chart and make it scale with the width of its container.
#### Success Criteria
- Resizing the browser window resizes the chart without distorting the bars
- No fixed pixel `width` remains on the `<svg>` element
#### Hints
- This is what `viewBox` plus `preserveAspectRatio` are for
- Try `width="100%"` alongside a `viewBox`
#### Resources
- [MDN: `preserveAspectRatio`](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/preserveAspectRatio)
- [Sara Soueidan: Understanding SVG coordinate systems](https://www.sarasoueidan.com/blog/svg-coordinate-systems/)

## 🔍 Validation Checklist
Before proceeding to the next day, verify:
- A local server serves your page
- Five bars render at correct relative heights with labels
- You can explain, out loud, why `y` is computed from the bottom up
- Your chart scales with its container
- You have inspected a real published chart and named its parts

## ⏱️ Time Estimate
3–4 hours. If you are past six, stop and ask for help — this day is a foundation, not a filter.
