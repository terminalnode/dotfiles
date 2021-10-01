from qutebrowser.config.config import ConfigContainer

# credits to theova/base16-qutebrowser for the original template
# and leosolid/qutebrowser-themes for the theme

##########
# COLORS #
##########

# base16 colors but with variable names that
# reflect what the color is mainly used for

bg_default = "#282c34"          # main shade darkest
bg_lighter = "#353b45"
bg_selection = "#3e4451"
# "#545862"
fg_disabled = "#565c64"
fg_default = "#abb2bf"
# "#b6bdca"
bg_lightest = "#c8ccd4"         # main shade lightest
fg_error = "#e06c75"            # red
# "#d19a66"                     # orange
bg_hint = "#e5c07b"             # yellow
fg_matched_text = "#98c379"     # green
bg_passthrough_mode = "#56b6c2" # teal
bg_insert_mode = "#61afef"      # blue
bg_warning = "#c678dd"          # purple
# "#be5046"                     # dark red

def set_theme(c: ConfigContainer):
    print("Setting the nordtheme!")
    set_completion_widget(c)
    set_downloads(c)
    set_hints(c)
    set_messages(c)
    set_prompts(c)
    set_status_bar(c)
    set_tab_bar(c)
    set_contextmenu(c)


def set_completion_widget(c: ConfigContainer):
    # Color of the completion widget for odd/even rows.
    c.colors.completion.odd.bg = bg_lighter
    c.colors.completion.even.bg = bg_default
    c.colors.completion.fg = fg_default
    # Category headers.
    c.colors.completion.category.fg = bg_hint
    c.colors.completion.category.bg = bg_default
    c.colors.completion.category.border.top = bg_default
    c.colors.completion.category.border.bottom = bg_default
    # Selected completion item.
    c.colors.completion.item.selected.fg = fg_default
    c.colors.completion.item.selected.bg = bg_selection
    c.colors.completion.item.selected.border.top = bg_selection
    c.colors.completion.item.selected.border.bottom = bg_selection
    c.colors.completion.item.selected.match.fg = fg_matched_text
    # Scrollbar/scrollbar handle (in completion view)
    c.colors.completion.scrollbar.fg = fg_default
    c.colors.completion.scrollbar.bg = bg_default
    # Matched text in the completion.
    c.colors.completion.match.fg = fg_matched_text


def set_downloads(c: ConfigContainer):
    # Color gradient interpolation system for download backgrounds.
    #   - rgb/hsv/hsl: Interpolate in the RGB/HSV/HSL color system.
    #   - none: Don't show a gradient.
    c.colors.downloads.system.bg = 'none'

    # Background color for the download bar.
    c.colors.downloads.bar.bg = bg_default
    # Color for downloads with errors.
    c.colors.downloads.error.fg = fg_error
    # Color gradient start for download backgrounds.
    c.colors.downloads.start.fg = bg_default
    c.colors.downloads.start.bg = bg_insert_mode
    # Color gradient stop for download backgrounds.
    c.colors.downloads.stop.fg = bg_default
    c.colors.downloads.stop.bg = bg_passthrough_mode


def set_hints(c: ConfigContainer):
    c.colors.hints.bg = bg_hint
    c.colors.hints.fg = bg_default
    c.colors.hints.match.fg = fg_default
    # Color of the keyhint widget.
    c.colors.keyhint.fg = fg_default
    c.colors.keyhint.bg = bg_default
    # Highlight color for keys to complete the current keychain.
    c.colors.keyhint.suffix.fg = fg_default


def set_messages(c: ConfigContainer):
    # Info messages
    c.colors.messages.info.bg = bg_default
    c.colors.messages.info.fg = fg_default
    c.colors.messages.info.border = bg_default
    # Error messages
    c.colors.messages.error.bg = fg_error
    c.colors.messages.error.fg = bg_default
    c.colors.messages.error.border = fg_error
    # Warning messages
    c.colors.messages.warning.bg = bg_warning
    c.colors.messages.warning.fg = bg_default
    c.colors.messages.warning.border = bg_warning


def set_prompts(c: ConfigContainer):
    c.colors.prompts.fg = fg_default
    c.colors.prompts.border = bg_default
    c.colors.prompts.bg = bg_default
    c.colors.prompts.selected.bg = bg_selection
    c.colors.prompts.selected.fg = fg_default


def set_status_bar(c: ConfigContainer):
    # Color of the statusbar.
    c.colors.statusbar.normal.bg = bg_default
    c.colors.statusbar.normal.fg = fg_matched_text
    # In insert mode.
    c.colors.statusbar.insert.bg = bg_insert_mode
    c.colors.statusbar.insert.fg = bg_default
    # In private browsing mode.
    c.colors.statusbar.private.bg = bg_lighter
    c.colors.statusbar.private.fg = bg_default
    # In passthrough mode.
    c.colors.statusbar.passthrough.bg = bg_passthrough_mode
    c.colors.statusbar.passthrough.fg = bg_default
    # In caret mode.
    # c.colors.statusbar.caret.bg = nord['magenta']
    # c.colors.statusbar.caret.fg = nord['snow-2']
    # [...] with a selection.
    # c.colors.statusbar.caret.selection.bg = nord['magenta']
    # c.colors.statusbar.caret.selection.fg = nord['snow-2']
    # In command mode.
    c.colors.statusbar.command.fg = fg_default
    # [...] while private browsing
    # c.colors.statusbar.command.private.bg = nord['polar-3']
    # c.colors.statusbar.command.private.fg = nord['snow-2']
    # Background color of the progress bar.
    # c.colors.statusbar.progress.bg = nord['snow-2']
    # c.colors.statusbar.url.fg = nord['snow-2']
    # c.colors.statusbar.url.success.http.fg = nord['snow-2']
    # c.colors.statusbar.url.success.https.fg = nord['green']
    # c.colors.statusbar.url.error.fg = nord['red']
    # c.colors.statusbar.url.hover.fg = nord['frost-2']
    # c.colors.statusbar.url.warn.fg = nord['orange']


def set_tab_bar(c: ConfigContainer):
    pass
#     # Color gradient for the tab indicator.
#     #   - rgb/hsv/hsl: Interpolate in the RGB/HSV/HSL color system.
#     #   - none: Don't show a gradient.
#     c.colors.tabs.indicator.system = 'none'
#     c.colors.tabs.indicator.start = nord['yellow']
#     c.colors.tabs.indicator.stop = nord['green']
#     c.colors.tabs.indicator.error = nord['red']
#     # Default colours
#     c.colors.tabs.bar.bg = nord['polar-1']
#     # Selected tabs bg
#     c.colors.tabs.selected.even.bg = nord['polar-4']
#     c.colors.tabs.pinned.selected.even.bg = nord['polar-4']
#     c.colors.tabs.selected.odd.bg = nord['polar-4']
#     c.colors.tabs.pinned.selected.odd.bg = nord['polar-4']
#     # Unselected tabs bg
#     c.colors.tabs.even.bg = nord['polar-1']
#     c.colors.tabs.pinned.even.bg = nord['polar-1']
#     c.colors.tabs.odd.bg = nord['polar-2']
#     c.colors.tabs.pinned.odd.bg = nord['polar-2']
#     # Selected tabs fg
#     c.colors.tabs.selected.even.fg = nord['yellow']
#     c.colors.tabs.pinned.selected.even.fg = nord['yellow']
#     c.colors.tabs.selected.odd.fg = nord['yellow']
#     c.colors.tabs.pinned.selected.odd.fg = nord['yellow']
#     # Unselected tabs fg
#     c.colors.tabs.even.fg = nord['snow-2']
#     c.colors.tabs.pinned.even.fg = nord['snow-2']
#     c.colors.tabs.odd.fg = nord['snow-2']
#     c.colors.tabs.pinned.odd.fg = nord['snow-2']

def set_contextmenu(c: ConfigContainer):
    # Background color of disabled items in the context menu.
    c.colors.contextmenu.disabled.bg = bg_lighter
    c.colors.contextmenu.disabled.fg = fg_disabled

    # Background color of the context menu
    c.colors.contextmenu.menu.bg = bg_default
    c.colors.contextmenu.menu.fg =  fg_default

    # Background color of the context menu’s selected item
    c.colors.contextmenu.selected.bg = bg_selection
    c.colors.contextmenu.selected.fg = fg_default

