// This file is like a preamble in latex //

// #import "@preview/ctheorems:1.1.3": *
#import "@preview/scribe:0.2.0": *

#let proof(it) = [
  *Beweis*.
  #it
]

#let example(it) = [
  *Beispiel*.
  #it
]

#let definition(it) = [
  *Definition*.
  #it
]

#let orga(it) = [
  *Organisatorisch*.
  #it
]

#let comment(it) = emph(text(blue, it))

#let puzzle(name, question, answer) = [
  *Raetsel* *#name*.
  #question

  *Loesung*.
  #answer
]


// Here we can put some definitions we want to use
#let up = $arrow.t$
#let tiny = $epsilon$

#let template(doc) = {
  set heading(numbering: "1.")
  set par(justify: true)
  set text(lang: "de")

  show: scribe
  // show: thmrules
  //

  doc
}


#let todo(body) = block(
  fill: luma(85%),
  inset: 8pt,
  radius: 4pt,
  stroke: 1pt,
  body,
)
