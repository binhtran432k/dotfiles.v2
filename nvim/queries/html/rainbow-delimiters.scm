;;; A pair of opening and closing tag with any content in-between. Excludes
;;; self-closing tags or opening tags without closing tag.

(element
  (start_tag
    "<" @opening.a
    (tag_name) @opening
    ">" @opening.b)
  ; (element (self_closing_tag) @intermediate)*
  (end_tag) @closing) @container

(style_element
  (start_tag
    "<" @opening.a
    (tag_name) @opening
    ">" @opening.b)
  ; (element (self_closing_tag) @intermediate)*
  (end_tag) @closing) @container

(script_element
  (start_tag
    "<" @opening.a
    (tag_name) @opening
    ">" @opening.b)
  (end_tag) @closing) @container

(element
  (self_closing_tag
    "<" @opening.0
    (tag_name) @opening
    "/>" @closing)) @container
