## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example------------------------------------------------------------------
library(convertxlsform)

path <- system.file("extdata", "all_types", "all_types.xlsx",
                    package = "convertxlsform")
basename(path)

## ----languages----------------------------------------------------------------
xlsform_languages(path)

## ----outline------------------------------------------------------------------
outline <- xlsform_outline(path)
nrow(outline)
head(outline[, c("serial", "block", "kind", "name", "relevant_text")], 10)

## ----docx---------------------------------------------------------------------
docx <- convertxlsform(path, output = tempdir(), overwrite = TRUE,
                       verbose = FALSE)
basename(docx)
file.exists(docx)

## ----docx-fr------------------------------------------------------------------
docx_fr <- convertxlsform(path, output = file.path(tempdir(), "all_types_fr.docx"),
                          lang = "fr", overwrite = TRUE, verbose = FALSE)
basename(docx_fr)

## ----pdf, eval = FALSE--------------------------------------------------------
# pdf <- convertxlsform(path, output = tempdir(), format = "pdf",
#                       overwrite = TRUE, verbose = FALSE)
# basename(pdf)
# file.exists(pdf)

