return {
  "windwp/nvim-autopairs",
  config = function()
    local success, autopairs_cmp = pcall(require, "nvim-autopairs.completion.cmp")
    if not success then
      vim.notify("failed to load: nvim-autopairs.completion.cmp")
      return
    end

    require("nvim-autopairs").setup({
      check_ts = true,
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    })

    require("cmp").event:on("confirm_done", autopairs_cmp.on_confirm_done({ map_char = { tex = "" } }))
  end
}
