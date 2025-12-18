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

#let orga(it) = [
  *Organisatorisch*.
  #it
]

#let comment(it) = emph(text(blue, it))

#let puzzle(name,question, answer) = [
  *Raetsel* *#name*.
  #question

  *Loesung*.
  #answer
]


// Here we can put some definitions we want to use
#let up = $arrow.t$
#let tiny = $epsilon$

#let list-to-array(it) = {
  if it.has("children") {
    (it.children.filter(c => c != [ ]).map(list-to-array))
  } else if it.has("body") {
    (list-to-array(it.body))
  } else {
    it
  }
}

#let hackenbush-position = list => $#list-to-array(list)$

#let template(doc) = {
  set heading(numbering: "1.")
  set par(justify: true)
  set text(lang: "de")

  show: scribe
  // show: thmrules
  //

  doc
}

