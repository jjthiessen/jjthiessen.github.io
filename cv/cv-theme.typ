#let accent-fill = color.hsl(240deg, 50%, 87.5%)
#let accent-edge = color.hsl(240deg, 50%, 75%)
#let link-color  = color.hsl(240deg, 50%, 25%)
#let link-stroke = (thickness: 0.5pt, paint: link-color)
#let sup-link-stroke = (thickness: 0.4pt, paint: link-color)
#let rule-color  = luma(75%)

#let serif-fonts = ("Source Serif 4", "DejaVu Serif")
#let sans-fonts = ("Source Sans 3", "DejaVu Sans")
#let mono-fonts = ("Source Code Pro", "DejaVu Sans Mono")

#let cat(items) = items.fold([], (a, b) => a + b)

// Internal state shared between cv() and the helpers below.
#let endnote-dict = state("cv-endnotes", (:))

#let ulink(dest, body) = {
  underline(stroke: link-stroke, link(dest, body))
}

#let suplink(stack, dest, body) = {
  let guts = super(link(dest, body))
  if stack { box(width: 0em, guts) }
  else { guts }
}

/// Superscript endnote reference, e.g. `#en("afol")`.
/// Each reference is a queryable link element; endnotes-block links each number back to the first occurrence of its note.
#let en(key, stack: false) = context {
  let d = endnote-dict.final()
  let n = {
    let i = 1
    for k in d.keys() {
      if k == key { break }
      i += 1
    }
    i
  }
  {
    suplink(stack, label("cvnote-" + str(n)))[#str(n)]
  }
}

#let code(body) = text(font: mono-fonts, body)

#let skill(item) = {
  let txt = if type(item) == dictionary { item.text } else { item }
  let note = if type(item) == dictionary and "note" in item { item.note } else { none }
  box(inset: (x: 0.25em, y: 0.25em), radius: 0.25em, fill: accent-fill)[
    #text(size: 0.75em)[#txt#{ if note != none { en(note) } }]
  ]
}

#let skill-row(items) = {
  set par(leading: 0.25em)
  let out = ()
  for (i, it) in items.enumerate() {
    if i > 0 { out.push(h(0.25em, weak: true)) }
    out.push(skill(it))
  }
  cat(out)
}

/// Normalize plain text vs. (name:, link:, note:) argument shapes.
#let named-arg(x) = {
  if x == none { none }
  else if type(x) == dictionary { x }
  else { (name: x,) }
}

/// One right-column line: date range + optional endnote mark.
/// Missing end renders as "–Present".
#let date-line(d) = {
  let end = if "end" in d and d.end != none { d.end } else { "Present" }
  let body = d.start + "–" + end
  if "note" in d and d.note != none { body + en(d.note) } else { body }
}

#let linkify(d) = {
  if d == none { none }
  else if "link" in d and d.link != none { ulink(d.link)[#d.name] }
  else { d.name }
}

/// An employment / education entry.
/// - org:      bold organisation, optionally (name:, link:, note:)
/// - title:    role or qualification, optionally linked
/// - type:     contract, full-time, etc
/// - skills:   array of pill labels; items may be (text:, note:)
/// - summary:  plain summary line (when there are no pills, e.g. degrees)
/// - details:  multi-line description, bulleted below the row
/// - dates:    array of (start:, end:, note:)
/// - location: right-column top line, e.g. [Remote] or [Kelowna~BC]
/// - nested:   child entries, indented ("Various Roles"-style blocks)
#let job(org: none, title: none, type: none, skills: (), summary: none, details: (), dates: (), location: none, nested: none) = block(above: 1em, below: 1.5em)[
  #{
    if org == none { return "[job(): missing org]" }
    let o = named-arg(org)
    let t = named-arg(title)
    let ty = named-arg(type)
    grid(columns: (1fr, auto), column-gutter: 2em)[
      #{
        set par(spacing: 0.5em)
        let out = ()
        if o != none {
          out.push({
            strong(linkify(o))
            if "note" in o and o.note != none { en(o.note) }
            linebreak()
          })
        }
        if t != none or ty != none {
          out.push({
            (t, ty).filter(x => x != none).map(linkify).join(" " + sym.dot + " ")
          })
        }

        if skills.len() > 0 { out.push(skill-row(skills)) }
        if summary != none { out.push(summary); out.push(linebreak()) }
        cat(out)

        if details.len() > 0 {
          block(inset: (left: 0.5em))[
            #{
              let out = ()
              for (i, b) in details.enumerate() {
                out.push(list.item(b))
              }
              cat(out)
            }
          ]
        }
      }
    ][
      #{
        set par(leading: 0.5em, justify: false)
        align(right + top)[#{
          let out = ()
          if location != none { out.push(location); out.push(linebreak()) }
          for d in dates { out.push(date-line(d)); out.push(linebreak()) }
          cat(out)
        }]
      }
    ]
    if nested != none {
      block(inset: (left: 0.5em), above: 0.75em, below: 0.75em, stack(
        line(length: 1em, stroke: 0.6pt + rule-color),
        block(inset: (left: 0.5em, top: 0.75em, bottom: 0.75em), stroke: (left: 0.5pt + rule-color), {
          nested
        }),
        line(length: 1em, stroke: 0.6pt + rule-color),
      ))
    }
  }
]

#let section(title, body) = {
  block(above: 2.5em, below: 1.5em)[#{
    set text(size: 1.25em)
    strong(title)
  }]
  body
}

#let quote-box(body) = block(inset: (left: 2em),
  block(fill: accent-fill, stroke: (left: 0.25em + accent-edge), inset: (x: 2em, y: 1.5em))[#{
    set par(first-line-indent: 2em, leading: 0.5em, spacing: 1em)
    set text(style: "oblique", size: 0.75em)
    body
  }]
)

/// Endnote list after the closing rule.
/// Each number links back to the first reference to its note in the body; notes that are never referenced render unlinked.
#let endnotes-block(d) = {
  v(2em)
  line(length: 100%, stroke: 0.5pt + rule-color)
  v(1em)
  context {
    set block(spacing: 0.5em)
    let refs = query(selector(link))
    for (i, k) in d.keys().enumerate(start: 1) {
      let num = "cvnote-" + str(i)
      let dest = label(num)
      let first = refs.filter(e => e.dest == dest).at(0, default: none)
      let back = "[" + (if first != none { link(first.location())[#str(i)] } else { str(i) }) + "]"
      grid(columns: (auto, 1fr), row-gutter: 1em, column-gutter: 1em)[#h(0em)#label(num)#back][#d.at(k)]
    }
  }
}

#let cv(body, name: none, address: none, contacts: (), endnotes: (:)) = {
  endnote-dict.update(endnotes)

  set page(paper: "us-letter", height: auto, margin: (x: 1in, y: 1in))
  set text(font: sans-fonts, size: 10pt, lang: "en", weight: 300, fill: luma(12.5%))
  set par(justify: true, leading: 0.5em, spacing: 1.1em)
  set document(title: "Curriculum Vitæ | Résumé")
  set strong(delta: 100)

  show link: set text(fill: link-color)

  grid(columns: (1fr, auto), column-gutter: 2em)[
    #{
      let out = ()
      out.push({
        strong(name) + linebreak()
      })
      if address != none { out.push(address); out.push(linebreak()) }
      cat(out)
    }
  ][
    #align(right + top)[#{
      let out = ()
      for c in contacts { out.push(ulink(c.link)[#c.text]); out.push(linebreak()) }
      cat(out)
    }]
  ]

  body

  v(1fr)

  endnotes-block(endnotes)
}
