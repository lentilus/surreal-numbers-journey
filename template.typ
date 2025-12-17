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

