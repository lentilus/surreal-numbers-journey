// This file is like a preamble in latex //

// #import "@preview/ctheorems:1.1.3": *
#import "@preview/scribe:0.2.0": *

#let proof(it) = [
  *Beweis*.
  #it
]

// Here we can put some definitions we want to use
#let up = $arrow.t$
#let tiny = $epsilon$

#let template(doc) = {
  set heading(numbering: "1.")
  set par(justify: true)

  show: scribe
  // show: thmrules
  //

  doc
}

// To update styles
#let orga(body) = block(
  fill: luma(95%),
  inset: 8pt,
  radius: 4pt,
  stroke: 1pt,
  body,
)

#let puzzle(label, question, solution) = block(
  inset: 10pt,
  radius: 6pt,
  stroke: 1pt,
  fill: luma(95%),
  [
    strong[Puzzle ] label

    v(6pt)
    question

    v(8pt)
    emph[Solution:]

    solution
  ],
)

#let todo(body) = block(
  fill: luma(85%),
  inset: 8pt,
  radius: 4pt,
  stroke: 1pt,
  body,
)
#let comment(body) = block(
  fill: luma(85%),
  inset: 8pt,
  radius: 4pt,
  stroke: 1pt,
  body,
)

#let example(body) = block(
  fill: luma(90%),
  stroke: 1pt,
  inset: 8pt,
  radius: 4pt,
  body,
)
