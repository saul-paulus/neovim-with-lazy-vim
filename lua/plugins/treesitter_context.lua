return {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
    opt = {
        enable = true,             -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0,             -- How many lines the window should span. Values <= 0 mean no limit.
        trim_scope = "outer",      -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        min_window_height = 0,     -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        patterns = {
            default = {
                "class",
                "function",
                "method",
                "for",
                "while",
                "if",
                "switch",
                "case",
            },
            tex = {
                "chapter",
                "section",
                "subsection",
                "subsubsection",
            },
            rust = {
                "impl_item",
                "struct",
                "enum",
            },
            scala = {
                "object_definition",
            },
            vhdl = {
                "process_statement",
                "architecture_body",
                "entity_declaration",
            },
            markdown = {
                "section",
            },
            elixir = {
                "anonymous_function",
                "arguments",
                "block",
                "do_block",
                "list",
                "map",
                "tuple",
                "quoted_content",
            },
            json = {
                "pair",
            },
            yaml = {
                "block_mapping_pair",
            },
        },
        zindex = 20,         -- The Z-index of the context window
        mode = "cursor",     -- Line used to calculate context. Choices: 'cursor', 'topline'
        separator = nil,
    }
}
