(TeX-add-style-hook
 "references"
 (lambda ()
   (LaTeX-add-bibitems
    "knuth84"
    "chambers2014"
    "wickham2019"
    "leisch2002"))
 '(or :bibtex :latex))

