local snips = {
    s(
        { trig = "lips", dscr = "Lorem Ipsum", },
        t( "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ),

    s(
        "haha",
        {
            c(1, {
                fmt("\\int {}", { r(1, "integrand") }),
                fmta("\\int_{<>}^{<>} <>", { i(1, "a"), i(2, "b"), r(3, "integrand") }),
            })
        }
    ),
}

return snips
