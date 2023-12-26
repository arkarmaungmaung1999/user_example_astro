return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "preservim/tagbar",
    keys = {
      {
        "<F8>",
        ":TagbarToggle<cr>",
        desc = "Open Tagbar",
      },
    },
  },
  {
    "Wansmer/treesj",
    -- keys = {
    --   {
    --     -- "<leader>m", ":TSJToggle<cr>", desc = "Toggle TS"
    --   }
    -- },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },
  -- {
  --   "ThePrimeagen/harpoon",
  --   dependencies = {"nvim-lua/plenary.nvim"},
  --   keys = {
  --     {
  --       "ha", ":lua require('harpoon.mark').add_file()<cr>", desc = 'Add to harpoon list',
  --       "<leader>m", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = " Show Harpoon "
  --     }
  --   }
  -- }
  {
    "MeanderingProgrammer/harpoon-core.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("harpoon-core").setup {
        -- Make existing window active rather than creating a new window
        use_existing = true,
        -- Default action when opening a mark, defaults to current window
        -- Example: 'vs' will open in new vertical split, 'tabnew' will open in new tab
        default_action = nil,
        -- Set marks specific to each git branch inside git repository
        mark_branch = false,
        -- Use the previous cursor position of marked files when opened
        use_cursor = true,
        -- Settings for popup window
        menu = {
          width = 60,
          height = 10,
        },
        -- Highlight groups to use for various components
        highlight_groups = {
          window = "HarpoonWindow",
          border = "HarpoonBorder",
        },
      }
    end,
    keys = {
      {
        "hx",
        ":lua require('harpoon-core.ui').toggle_quick_menu()<cr>",
        desc = "Show Harpoon ist",
      },
      {
        "ha",
        ":lua require('harpoon-core.mark').add_file()<cr>",
        desc = "Add to Harpoon",
      },
      {
        "hr",
        ":lua require('harpoon-core.mark').rm_file()<cr>",
        desc = "Remove from Harpoon",
      },
    },
  },
  {
    "arcticicestudio/nord-vim",
  },
  {
    "vim-airline/vim-airline",
    lazy = false,
  },
  {
    "vim-airline/vim-airline-themes",
    lazy = false,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-dap-virtual-text").setup {
        enabled = true, -- enable this plugin (the default)
        enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true, -- show stop reason when stopped for exceptions
        commented = false, -- prefix virtual text with comment string
        only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
        all_references = false, -- show virtual text on all all references of the variable (not only definitions)
        clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
        --- A callback that determines how a variable is displayed or whether it should be omitted
        --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
        --- @param buf number
        --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
        --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
        --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
        --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
        display_callback = function(variable, buf, stackframe, node, options)
          if options.virt_text_pos == "inline" then
            return " = " .. variable.value
          else
            return variable.name .. " = " .. variable.value
          end
        end,
        -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
        virt_text_pos = vim.fn.has "nvim-0.10" == 1 and "inline" or "eol",

        -- experimental features:
        all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
      }
    end,
  },
}
