local utils = require("snippets.utils")

return {
    s(
    { trig = "template", dscr = "Template article", },
    fmta(
    [[
    \documentclass[<>]{<>}

    %% Packages

    % Math
    \usepackage{amsmath}
    \usepackage{amsfonts}
    \usepackage{amssymb}
    \usepackage{empheq} % box equations
    \usepackage{cancel}
    \usepackage{esint} % closed integrals (\oint)
    \usepackage{amsthm} % theorems-like envs
    \usepackage{physics}

    % Enumerate custom tags
    \usepackage{enumitem}


    %% Commands

    % Use parentheses for references
    \let\oldref\ref
    \renewcommand{\ref}[1]{(\oldref{#1})}

    % Roman numerals in upper case
    \newcommand{\rom}[1]
    {\MakeUppercase{\romannumeral #1}}

    % Unit vectors
    \newcommand{\ihat}{\,\boldsymbol{\hat{\imath}}}
    \newcommand{\jhat}{\,\boldsymbol{\hat{\jmath}}}
    \newcommand{\khat}{\,\boldsymbol{\hat{k}}}
    \newcommand{\rhat}{\,\boldsymbol{\hat{r}}}
    \newcommand{\that}{\,\boldsymbol{\hat{\theta}}}

    % Common sets
    \newcommand{\reals}{\mathbb{R}}
    \newcommand{\complex}{\mathbb{C}}
    \newcommand{\vecesp}{\mathbb{V}}
    \newcommand{\wecesp}{\mathbb{W}}
    \newcommand{\cuerpo}{\mathbb{K}}

    % Operators

    % Differential
    \newcommand{\dif}{\;\mathrm{d}}

    % Real and imaginary part
    \let\oldRe\Re
    \renewcommand{\Re}{\operatorname{Re}}
    \let\oldIm\Im
    \renewcommand{\Im}{\operatorname{Im}}

    % Complex conjugate
    \newcommand{\conj}[1]{\overline{#1}}

    % Norm of a vector
    % \newcommand{\norm}[1]{\left\lVert #1 \right\rVert}

    % Range of a matrix
    \DeclareMathOperator{\rg}{rg}

    % What i use to indicate a constante value
    \DeclareMathOperator{\const}{\,const\,}

    % Capital letters in subscripts
    \newcommand{\sub}[1]{\scriptscriptstyle {#1}}

    \title{<>}
    \author{<>}
    \date{<>}

    \begin{document}

    \maketitle

    \tableofcontents

    \newtheorem*{theorem}{Teorema}
    \newtheorem*{corollary}{Corolario}
    \theoremstyle{definition}
    \newtheorem*{obs}{Observación}
    \theoremstyle{definition}
    \newtheorem*{definition}{Definición}

    <>

    \end{document}
    ]],
    {
        i(2, "a4paper"),
        i(1, "article"),
        i(3),
        i(4),
        i(5),
        i(0),
    }
    )
    )
}
