local obsidian = {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    -- only loads for
    event = {
        "BufReadPre " .. vim.fn.expand("~") .. "/Documents/kasi/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/Documents/kasi/**.md",
    },

    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
        "nvim-treesitter/nvim-treesitter",
    },

    config = function()
        local obsidian = require("obsidian")

        obsidian.setup({
            workspaces = {
                {
                    name = "w",
                    path = "~/Documents/kasi",
                },
            },

            -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
            -- levels defined by "vim.log.levels.*".
            log_level = vim.log.levels.INFO,

            notes_subdir = "poki",

            daily_notes = {
                -- Optional, if you keep daily notes in a separate directory.
                folder = "daily",
                -- Optional, if you want to change the date format for the ID of daily notes.
                date_format = "%d-%m-%Y",
                -- Optional, if you want to change the date format of the default alias of daily notes.
                alias_format = "%a %x",
                -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
                template = nil
            },

            -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
            completion = {
                -- Set to false to disable completion.
                nvim_cmp = true,

                -- Trigger completion at 2 chars.
                min_chars = 2,

                -- Where to put new notes created from completion. Valid options are
                --  * "current_dir" - put new notes in same directory as the current buffer.
                --  * "notes_subdir" - put new notes in the default notes subdirectory.
                new_notes_location = "current_dir",

                -- Either 'wiki' ([[]]) or 'markdown' ([]).
                preferred_link_style = "wiki",

                -- Control how wiki links are completed with these (mutually exclusive) options:
                prepend_note_id = true,
                prepend_note_path = false,
                use_path_only = false,
            },

            mappings = {
                ["<CR>"] = {
                    action = function()
                        if obsidian.util.cursor_on_markdown_link() then
                            vim.cmd("ObsidianFollowLink")
                        else
                            obsidian.util.toggle_checkbox()
                        end
                    end,
                    opts = { buffer = true },
                },
                -- new note
                ["<leader>on"] = {
                    action = function()
                        vim.cmd("ObsidianNew")
                    end,
                },
                ["<leader>os"] = {
                    action = function()
                        vim.cmd("ObsidianSearch")
                    end,
                },
                -- paste image
                ["<leader>op"] = {
                    action = function()
                        obsidian.get_client():command("ObsidianPasteImg", {})
                    end,
                },
            },

            -- Optional, customize how names/IDs for new notes are created.
            note_id_func = function(title)
                -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                -- In this case a note with the title 'My new note' will be given an ID that looks
                -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                -- local time = tostring(os.time())
                -- local suffix = ""
                -- if title ~= nil then
                --     -- If title is given, transform it into valid file name.
                --     suffix = "_" .. title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                -- end
                -- return time .. suffix
                return title
            end,

            -- Optional, boolean or a function that takes a filename and returns a boolean.
            -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
            disable_frontmatter = false,

            -- yaml at the top of each note
            note_frontmatter_func = function(note)
                local out = { aliases = note.aliases, tags = note.tags, date = os.date("%a %d/%m/%Y"), }

                -- `note.metadata` contains any manually added fields in the frontmatter.
                -- So here we just make sure those fields are kept in the frontmatter.
                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end

                return out
            end,

            templates = {
                subdir = "0-templates",
                date_format = "%a %d/%m/%Y",
                time_format = "%H:%M",
                -- A map for custom variables, the key should be the variable and the value a function
                substitutions = {},
            },

            -- Optional, customize the backlinks interface.
            backlinks = {
                -- The default height of the backlinks location list.
                height = 10,
                -- Whether or not to wrap lines.
                wrap = false,
            },

            -- Optional, customize the tags interface.
            tags = {
                -- The default height of the tags location list.
                height = 10,
                -- Whether or not to wrap lines.
                wrap = false,
            },

            -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
            -- URL it will be ignored but you can customize this behavior here.
            follow_url_func = function(url)
                print("Opening " .. url)
                -- Open the URL in the default web browser.
                vim.fn.jobstart({ "xdg-open", url })
            end,

            -- Optional, set to true if you use the Obsidian Advanced URI plugin.
            -- https://github.com/Vinzent03/obsidian-advanced-uri
            use_advanced_uri = false,

            -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
            open_app_foreground = false,

            -- Optional, by default commands like `:ObsidianSearch` will attempt to use
            -- telescope.nvim, fzf-lua, fzf.vim, or mini.pick (in that order), and use the
            -- first one they find. You can set this option to tell obsidian.nvim to always use this
            -- finder.
            finder = "telescope.nvim",

            -- Optional, configure key mappings for the finder. These are the defaults.
            -- If you don't want to set any mappings this way then set
            finder_mappings = {
                -- Create a new note from your query with `:ObsidianSearch` and `:ObsidianQuickSwitch`.
                -- Currently only telescope supports this.
                new = "<C-x>",
            },

            -- Optional, sort search results by "path", "modified", "accessed", or "created".
            -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
            -- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
            sort_by = "modified",
            sort_reversed = true,

            -- Optional, determines how certain commands open notes. The valid options are:
            -- 1. "current" (the default) - to always open in the current window
            -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
            -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
            open_notes_in = "current",

            -- Optional, configure additional syntax highlighting / extmarks.
            -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
            ui = {
                enable = true,         -- set to false to disable all additional syntax features
                update_debounce = 200, -- update delay after a text change (in milliseconds)

                -- i dislike icons
                checkboxes = {
                    -- -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                    -- [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    -- ["x"] = { char = "", hl_group = "ObsidianDone" },
                    -- [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    -- ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },

                    -- You can also add more custom ones...
                },
                bullets = { char = "-", hl_group = "ObsidianBullet" },
                external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                reference_text = { hl_group = "ObsidianRefText" },
                highlight_text = { hl_group = "ObsidianHighlightText" },
                tags = { hl_group = "ObsidianTag" },
                hl_groups = {
                    -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                    ObsidianTodo = { bold = true, fg = "#d79921" },
                    ObsidianDone = { bold = true, fg = "#4a697d" },
                    ObsidianRightArrow = { bold = true, fg = "#d65d0e" },
                    ObsidianTilde = { bold = true, fg = "#cc241d" },
                    ObsidianBullet = { bold = true, fg = "#458588" },
                    ObsidianRefText = { underline = true, fg = "#98971a" },
                    ObsidianExtLinkIcon = { fg = "#b16282" },
                    ObsidianTag = { italic = true, fg = "#d3869b" },
                    ObsidianHighlightText = { bg = "#689d6a" },
                },
                attachments = {
                    img_folder = "0-media",
                },
            },
        })
    end,
}

return obsidian
