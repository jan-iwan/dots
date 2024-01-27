local colors = {
    ["black"] =         "#263640",
    ["red"] =           "#cc241d",
    ["green"] =         "#98971a",
    ["yellow"] =        "#d79921",
    ["blue"] =          "#458588",
    ["magenta"] =       "#b16282",
    ["cyan"] =          "#689d6a",
    ["white"] =         "#a89984",
    ["orange"] =        "#d65d0e",

    ["bri black"] =     "#4a697d",
    ["bri red"] =       "#fb4934",
    ["bri green"] =     "#b8bb26",
    ["bri yellow"] =    "#fabd2f",
    ["bri blue"] =      "#83a598",
    ["bri magenta"] =   "#d3869b",
    ["bri cyan"] =      "#8ec07c",
    ["bri white"] =     "#f9f5d7",
    ["bri orange"] =    "#fe8019",

    ["dim black"] =     "#3c3836",
    ["dim red"] =       "#9d0006",
    ["dim green"] =     "#79740e",
    ["dim yellow"] =    "#b57614",
    ["dim blue"] =      "#076678",
    ["dim magenta"] =   "#8f3f71",
    ["dim cyan"] =      "#327b58",
    ["dim white"] =     "#928374",
    ["dim orange"] =    "#af3a03",

    ["bg"] =            "#1d2021",
    ["fg"] =            "#ebdbb2",

    ["bri bg"] =        "#504945",
    ["bri fg"] =        "#fbf1c7",

    ["dim bg"] =        "#282828",
    ["dim fg"] =        "#bdae93",

    ["alt bg"] =        "#32302f",
    ["alt fg"] =        "#d5c4a1",
}

-- colors in order
local icolors = {}

local order = {
    color = {
        "black",
        "red",
        "green",
        "yellow",
        "blue",
        "magenta",
        "cyan",
        "white",
        "orange",
    },
    intensity = {
        "",
        "bri ",
        "dim ",
    },
    text = {
        "bg",
        "fg",
    }
}

-- colors
for _, intensity in ipairs(order.intensity) do
    for _, color in ipairs(order.color) do
        local name = intensity .. color

        table.insert(icolors, { name=name, code=colors[name] })
    end
end

-- bg and fg
for _, intensity in ipairs(order.intensity) do
    for _, text in ipairs(order.text) do
        local name = intensity .. text

        table.insert(icolors, { name=name, code=colors[name] })
    end
end
for _, text in ipairs(order.text) do
    local name = "alt " .. text

    table.insert(icolors, { name=name, code=colors[name] })
end

return { colors=colors, icolors=icolors }
