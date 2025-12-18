#import "@preview/cetz:0.4.2"

#let hackenbush(
  nodes,
  edges,
  size: 0.7,
) = {
  cetz.canvas({
    import cetz.draw: *

    scale(size)

    // Draw edges
    for edge in edges {
      let from = nodes.at(edge.at(0))
      let to = nodes.at(edge.at(1))
      let color = edge.at(2)
      let style = if edge.len() > 3 { edge.at(3) } else { "solid" }

      line(
        from,
        to,
        stroke: (
          dash: style,
          paint: color,
          thickness: 2.5pt
        ),
      )
    }

    // Draw nodes
    for node in nodes {
      circle(
        node,
        fill: white,
        stroke: (
          paint: black,
          thickness: 0.8pt
        ),
        radius: 2.0pt,
      )
    }

    // Compute x-range
    let min-x = nodes.at(0).at(0)
    let max-x = nodes.at(0).at(0)

    for node in nodes {
      let x = node.at(0)
      if x < min-x { min-x = x }
      if x > max-x { max-x = x }
    }

    // Baseline
    line(
      (min-x - 1, 0),
      (max-x + 1, 0),
      stroke: (
        dash: "dotted",
        paint: black,
        thickness: 1pt,
      ),
    )
  })
}

// #let nodes = (
//   (0, 0),
//   (0, 1),
//   (1, 1),
// )
//
// #let edges = (
//   (0, 2, green, "solid"),
//   (1, 2, blue),
//   (0, 1, red, "dashed"),
// )
//
// #hackenbush(nodes, edges, size: 1.5)

// ==========
// ==========
// ==========
// Uncircular Hackenbush
// ==========
// ==========
// ==========


#let to_color(v) = {
  if v == "R" {
    return red
  }
  if v == "G" {
    return green
  }
  if v == "B" {
    return blue
  }
  return black
}

#let concat(l, s) = {
  return (l, s).join()
}

#let replace_first(list, with) = {
  return (with,) + list.slice(1)
}

#let game_normal_form_to_graphics_input_recursion(gnf) = {
  // returns (nodes, edges, width)
  // the left most node is at x = 0

  if (gnf.len() == 0) {
    return (((0, 0),), (), 0)
  }

  let subtrees = gnf.map(
    r => game_normal_form_to_graphics_input_recursion(r.at(1)),
  )
  let spacing = 0.5
  let total_width = subtrees.map(r => r.at(2)).sum() + (gnf.len() - 1) * spacing

  let nodes = ((total_width / 2, 0),)
  let edges = ()

  let prev_node_count = 1
  let offset_width = 0

  for (i, tree) in subtrees.enumerate() {
    nodes = concat(
      nodes,
      tree.at(0).map(r => (r.at(0) + offset_width, r.at(1) + 1)),
    )
    edges = concat(
      edges,
      tree
        .at(1)
        .map(
          from_to_col => (
            from_to_col.at(0) + prev_node_count,
            from_to_col.at(1) + prev_node_count,
            from_to_col.at(2),
          ),
        ),
    )
    offset_width = offset_width + tree.at(2) + spacing

    edges.push((
      0,
      prev_node_count,
      to_color(gnf.at(i).at(0)),
    ))
    prev_node_count = nodes.len()
  }


  // Optionally: center bottom node between most bottom layers
  let first_level_nodes = nodes.filter(node => node.at(1) == 1)
  nodes = replace_first(
    nodes,
    (
      (
        first_level_nodes.at(0).at(0) + first_level_nodes.at(first_level_nodes.len() - 1).at(0)
      )
        / 2,
      0,
    ),
  )

  return (nodes, edges, total_width)
}

#let game_normal_form_to_graphics_input(gnf) = {
  let nodes_edges = game_normal_form_to_graphics_input_recursion(gnf)

  let nodes = nodes_edges.at(0)
  let edges = nodes_edges.at(1)

  let new_edges = () // As to not interfer with loop
  let new_nodes = nodes.slice(1)

  for edge in edges {
    // We know that the first node reference is always at the first index and that the first node is at 0
    if (edge.at(0) == 0) {
      new_edges.push(
        (
          new_nodes.len(),
          edge.at(1) - 1,
          edge.at(2),
        ),
      )
      new_nodes.push((
        nodes.at(edge.at(1)).at(0),
        0,
      ))
    } else {
      new_edges.push(
        (
          edge.at(0) - 1,
          edge.at(1) - 1,
          edge.at(2),
        ),
      )
    }
  }

  return (new_nodes, new_edges)
}

//
//
// #let game_normal_form = (
//   ("R", ()),
//   (
//     "B",
//     (
//       (
//         "R",
//         (
//           ("G", ()),
//           ("G", ()),
//         ),
//       ),
//       ("B", ()),
//     ),
//   ),
// )
// #let res = game_normal_form_to_graphics_input(game_normal_form)
// #hackenbush(res.at(0), res.at(1))

// ======================
// ======================
// Syntax sugar to game normal form
// ======================
// ======================

#let to_normal_form(x) = {
  if type(x) == str {
    return (x, ())
  }

  if type(x) == array {
    return (
      x.at(0),
      x.slice(1).map(to_normal_form),
    )
  }
}

#let directed_hackenbush(game) = {
  let nf = game.map(to_normal_form)
  let res = game_normal_form_to_graphics_input(nf)
  hackenbush(res.at(0), res.at(1))
}


// #let game = (
//   "R",
//   ("B", ("R", "G", "G"), "B"),
// )
//
// #let game_normal_form = (
//   ("R", ()),
//   (
//     "B",
//     (
//       (
//         "R",
//         (
//           ("G", ()),
//           ("G", ()),
//         ),
//       ),
//       ("B", ()),
//     ),
//   ),
// )
//
// #directed_hackenbush(game)

