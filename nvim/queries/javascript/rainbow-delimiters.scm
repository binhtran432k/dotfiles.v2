; extends

(jsx_element
  open_tag: (jsx_opening_element
              "<" @opening.a
              name: (_) @opening
              ">" @opening.b)
  close_tag: (jsx_closing_element) @closing) @container

(jsx_self_closing_element
  "<" @opening.a
  name: (_) @opening
  "/>" @closing) @container

(jsx_expression
  "{" @opening
  "}" @closing) @container
