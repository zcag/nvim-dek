; TOML `templates.*` keys -> inject htmldjango (jinja2)

; templates.key = """ ... """
(pair
  (dotted_key
    (bare_key) @_parent
    (bare_key))
  (string) @injection.content
  (#eq? @_parent "templates")
  (#match? @injection.content "^\"\"\"")
  (#set! injection.language "htmldjango")
  (#offset! @injection.content 0 3 0 -3))

; templates.key = " ... "
(pair
  (dotted_key
    (bare_key) @_parent
    (bare_key))
  (string) @injection.content
  (#eq? @_parent "templates")
  (#match? @injection.content "^\"")
  (#set! injection.language "htmldjango")
  (#offset! @injection.content 0 1 0 -1))

; templates = { key = " ... " }
(pair
  (bare_key) @_parent
  (inline_table
    (pair
      (bare_key)
      (string) @injection.content))
  (#eq? @_parent "templates")
  (#match? @injection.content "^\"")
  (#set! injection.language "htmldjango")
  (#offset! @injection.content 0 1 0 -1))

; TOML key `expr` -> inject htmldjango (jinja2)

; expr = " ... "
(pair
  (bare_key) @_expr
  (string) @injection.content
  (#eq? @_expr "expr")
  (#match? @injection.content "^\"")
  (#set! injection.language "htmldjango")
  (#offset! @injection.content 0 1 0 -1))

; expr = """ ... """
(pair
  (bare_key) @_expr
  (string) @injection.content
  (#eq? @_expr "expr")
  (#match? @injection.content "^\"\"\"")
  (#set! injection.language "htmldjango")
  (#offset! @injection.content 0 3 0 -3))

; TOML key `cmd` -> inject bash into string values (single or multiline)

; """ ... """
(pair
  (bare_key) @k
  (string) @injection.content
  (#match? @k "^(cmd|apply|check|foreach)$")
  (#match? @injection.content "^\"\"\"")
  (#set! injection.language "bash")
  (#offset! @injection.content 0 3 0 -3))

; " ... "
(pair
  (bare_key) @k
  (string) @injection.content
  (#match? @k "^(cmd|apply|check|foreach)$")
  (#match? @injection.content "^\"")
  (#set! injection.language "bash")
  (#offset! @injection.content 0 1 0 -1))

; ''' ... '''
(pair
  (bare_key) @k
  (string) @injection.content
  (#match? @k "^(cmd|apply|check|foreach)$")
  (#match? @injection.content "^'''")
  (#set! injection.language "bash")
  (#offset! @injection.content 0 3 0 -3))

; ' ... '
(pair
  (bare_key) @k
  (string) @injection.content
  (#match? @k "^(cmd|apply|check|foreach)$")
  (#match? @injection.content "^'")
  (#set! injection.language "bash")
  (#offset! @injection.content 0 1 0 -1))
