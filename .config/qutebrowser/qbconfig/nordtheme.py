from qutebrowser.config.config import ConfigContainer

nord = {
    # Polar Night
    'polar-1': '#2e3440', 'polar-2': '#3b4252',
    'polar-3': '#434c5e', 'polar-4': '#4c566a',
    # Snow Storm
    'snow-1': '#d8dee9', 'snow-2': '#e5e9f0', 'snow-3': '#eceff4',
    # Frost
    'frost-1': '#8fbcbb', 'frost-2': '#88c0d0',
    'frost-3': '#81a1c1', 'frost-4': '#5e81ac',
    # Aurora
    'red':   '#bf616a', 'orange':  '#d08770', 'yellow': '#ebcb8b',
    'green': '#a3be8c', 'magenta': '#b48ead',
}


def set_theme(c: ConfigContainer):
    print("Setting the nordtheme!")
    set_completion_widget(c)
    set_downloads(c)
    set_hints(c)
    set_messages(c)
    set_prompts(c)
    set_status_bar(c)
    set_tab_bar(c)


def set_completion_widget(c: ConfigContainer):
    print(nord)
    # Color of the completion widget for odd/even rows.
    c.colors.completion.odd.bg = nord['polar-2']
    c.colors.completion.even.bg = nord['polar-2']
    c.colors.completion.fg = nord['snow-1']
    # Category headers.
    c.colors.completion.category.bg = nord['polar-1']
    c.colors.completion.category.fg = nord['snow-2']
    c.colors.completion.category.border.top = nord['polar-1']
    c.colors.completion.category.border.bottom = nord['polar-1']
    # Selected completion item.
    c.colors.completion.item.selected.bg = nord['polar-4']
    c.colors.completion.item.selected.fg = nord['snow-3']
    c.colors.completion.item.selected.border.top = nord['polar-4']
    c.colors.completion.item.selected.border.bottom = nord['polar-4']
    # Scrollbar/scrollbar handle (in completion view)
    c.colors.completion.scrollbar.bg = nord['polar-2']
    c.colors.completion.scrollbar.fg = nord['snow-2']
    # Matched text in the completion.
    c.colors.completion.match.fg = nord['yellow']


def set_downloads(c: ConfigContainer):
    # Color gradient interpolation system for download backgrounds.
    #   - rgb/hsv/hsl: Interpolate in the RGB/HSV/HSL color system.
    #   - none: Don't show a gradient.
    c.colors.downloads.system.bg = 'none'

    # Background color for the download bar.
    c.colors.downloads.bar.bg = nord['polar-1']
    # Color for downloads with errors.
    c.colors.downloads.error.bg = nord['red']
    c.colors.downloads.error.fg = nord['snow-2']
    # Color gradient stop for download backgrounds.
    c.colors.downloads.stop.bg = nord['magenta']


def set_hints(c: ConfigContainer):
    c.colors.hints.bg = nord['yellow']
    c.colors.hints.fg = nord['polar-1']
    c.colors.hints.match.fg = nord['frost-4']
    # Color of the keyhint widget.
    c.colors.keyhint.bg = nord['polar-2']
    c.colors.keyhint.fg = nord['snow-2']
    # Highlight color for keys to complete the current keychain.
    c.colors.keyhint.suffix.fg = nord['yellow']


def set_messages(c: ConfigContainer):
    # Info messages
    c.colors.messages.info.bg = nord['polar-1']
    c.colors.messages.info.fg = nord['frost-2']
    c.colors.messages.info.border = nord['frost-2']
    # Error messages
    c.colors.messages.error.bg = nord['polar-1']
    c.colors.messages.error.fg = nord['red']
    c.colors.messages.error.border = nord['red']
    # Warning messages
    c.colors.messages.warning.bg = nord['polar-1']
    c.colors.messages.warning.fg = nord['orange']
    c.colors.messages.warning.border = nord['orange']


def set_prompts(c: ConfigContainer):
    c.colors.prompts.bg = nord['polar-3']
    c.colors.prompts.fg = nord['snow-2']
    c.colors.prompts.selected.bg = nord['polar-4']
    c.colors.prompts.border = '1px solid ' + nord['polar-1']


def set_status_bar(c: ConfigContainer):
    # Color of the statusbar.
    c.colors.statusbar.normal.bg = nord['polar-1']
    c.colors.statusbar.normal.fg = nord['snow-2']
    # In insert mode.
    c.colors.statusbar.insert.bg = nord['green']
    c.colors.statusbar.insert.fg = nord['polar-2']
    # In private browsing mode.
    c.colors.statusbar.private.bg = nord['polar-4']
    c.colors.statusbar.private.fg = nord['snow-2']
    # In passthrough mode.
    c.colors.statusbar.passthrough.bg = nord['frost-4']
    c.colors.statusbar.passthrough.fg = nord['snow-2']
    # In caret mode.
    c.colors.statusbar.caret.bg = nord['magenta']
    c.colors.statusbar.caret.fg = nord['snow-2']
    # [...] with a selection.
    c.colors.statusbar.caret.selection.bg = nord['magenta']
    c.colors.statusbar.caret.selection.fg = nord['snow-2']
    # In command mode.
    c.colors.statusbar.command.bg = nord['polar-3']
    c.colors.statusbar.command.fg = nord['snow-2']
    # [...] while private browsing
    c.colors.statusbar.command.private.bg = nord['polar-3']
    c.colors.statusbar.command.private.fg = nord['snow-2']
    # Background color of the progress bar.
    c.colors.statusbar.progress.bg = nord['snow-2']
    c.colors.statusbar.url.fg = nord['snow-2']
    c.colors.statusbar.url.success.http.fg = nord['snow-2']
    c.colors.statusbar.url.success.https.fg = nord['green']
    c.colors.statusbar.url.error.fg = nord['red']
    c.colors.statusbar.url.hover.fg = nord['frost-2']
    c.colors.statusbar.url.warn.fg = nord['orange']


def set_tab_bar(c: ConfigContainer):
    # Color gradient for the tab indicator.
    #   - rgb/hsv/hsl: Interpolate in the RGB/HSV/HSL color system.
    #   - none: Don't show a gradient.
    c.colors.tabs.indicator.system = 'none'
    c.colors.tabs.indicator.start = nord['yellow']
    c.colors.tabs.indicator.stop = nord['green']
    c.colors.tabs.indicator.error = nord['red']
    # Default colours
    c.colors.tabs.bar.bg = nord['polar-1']
    # Selected tabs bg
    c.colors.tabs.selected.even.bg = nord['polar-4']
    c.colors.tabs.pinned.selected.even.bg = nord['polar-4']
    c.colors.tabs.selected.odd.bg = nord['polar-4']
    c.colors.tabs.pinned.selected.odd.bg = nord['polar-4']
    # Unselected tabs bg
    c.colors.tabs.even.bg = nord['polar-1']
    c.colors.tabs.pinned.even.bg = nord['polar-1']
    c.colors.tabs.odd.bg = nord['polar-2']
    c.colors.tabs.pinned.odd.bg = nord['polar-2']
    # Selected tabs fg
    c.colors.tabs.selected.even.fg = nord['yellow']
    c.colors.tabs.pinned.selected.even.fg = nord['yellow']
    c.colors.tabs.selected.odd.fg = nord['yellow']
    c.colors.tabs.pinned.selected.odd.fg = nord['yellow']
    # Unselected tabs fg
    c.colors.tabs.even.fg = nord['snow-2']
    c.colors.tabs.pinned.even.fg = nord['snow-2']
    c.colors.tabs.odd.fg = nord['snow-2']
    c.colors.tabs.pinned.odd.fg = nord['snow-2']
