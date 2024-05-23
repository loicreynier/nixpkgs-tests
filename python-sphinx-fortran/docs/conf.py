# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

import os
import sys

sys.path.insert(0, os.path.abspath("../src/quickmaths"))

project = "quickmaths"
copyright = "2024, Flash McQueen"
author = "Flash McQueen"

extensions = [
    "sphinxfortran.fortran_domain",
    "sphinxfortran.fortran_autodoc",
]

fortran_src = ["../quickmaths.f90"]


templates_path = ["_templates"]
exclude_patterns = ["_build", "Thumbs.db", ".DS_Store"]

html_theme = "sphinx_rtd_theme"
html_static_path = ["_static"]
