local dashboard = require('dashboard')    
local icons = require("redraincatching.core.icons")
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>aa', '<cmd>Dashboard<cr>', {desc = "dashboard display"})

dashboard.setup({
    lazy = false,
    theme = 'doom',
    hide = {
        statusline = false,
    },
    config = {
        header = {
        '                                                                                ',
        '                                       ██████ ██                                ',
        '                                   ███████                                      ',
        '                               ██████                                           ',
        '                            ██████                                              ',
        '                          ███ ██                                                ',
        '                       █████                                                    ',
        '                     ██ ██ ██                                                   ',
        '                   ██████                                                       ',
        '                  ███                                                           ',
        '                █████                                                           ',
        '               █████                                                            ',
        '              ███                                                               ',
        '             ███                                                                ',
        '            █  █                                                                ',
        '           █ ████                                                               ',
        '          ██  █                                                                 ',
        '         ██   █                                                                 ',
        '         █   █          i\'m still here                                         ',
        '         ██  █ █                                                                ',
        '        ██  █ █                                                                 ',
        '        █   ███                                                                 ',
        '        █████ █                                                                 ',
        '       ███ ████                                                                 ',
        '       ██ ███                                                                   ',
        '       ██  █████                                                                ',
        '        █ ███ ██                                                                ',
        '        █  ████                                                                 ',
        '        █  █████████                                                            ',
        '         █   ███████████                                                        ',
        '         █  █ █ ████ ██                                                         ',
        '          █  ███ ███  █                                                         ',
        '           █   ██  ████                                                         ',
        '           ██ ████  ██                                                          ',
        '             █ ██ █  █      █                                                   ',
        '              █ ████ ███████                                                    ',
        '               ██ ███ ██   ██                                                   ',
        '                ██████ █████                                                    ',
        '                  ██ ████████                                                   ',
        '                    ██████ ██                                                   ',
        '                      ███  ██████                                               ',
        '                         ███ ██████████                                         ',
        '                            ███  ██████ ███   █ ██           █████              ',
        '                                █████████████ █████   █████████                 ',
        '                                      ███████████████████ █                     ',
        '                                            ██████                              ',
        '                                                                                ',
        '                                                                                '
        },
        center = {
            { key = "n", icon = icons.ui.NewFile, desc = " new file", action = "ene | startinsert" },
            { key = "r", icon = icons.ui.Files, desc = " recent files", action = telescope.oldfiles },
            { key = "f", icon = icons.ui.FindFile, desc = "  find file ", action = telescope.find_files },
            { key = "e", icon = icons.ui.Files, desc = " file explorer", action = "NvimTreeToggle"},
            { key = "t", icon = icons.ui.Text, desc = " find text", action = telescope.live_grep },
            { key = "h", icon = icons.ui.Check, desc = "  check health", action = "checkhealth"},
            { key = "l", icon = icons.ui.Event, desc =  " lazy", action = "Lazy" },
            { key = "q", icon = icons.ui.Quit, desc = " quit", action = "qa"},
        },

        footer = function()
            local ui = require("redraincatching.core.icons").ui
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
                ui.Lazy .. "loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. " ms",
            }
        end
    }
})
