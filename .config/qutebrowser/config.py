# pylint: disable=C0111
from pathlib import Path

from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer
from qbconfig import searchengines
from qbconfig import nordtheme as theme

try:
    import setproctitle
    setproctitle.setproctitle("qutebrowser")
except ModuleNotFoundError:
    print("Could not import setproctitle, won't be able to set process title.")

config: ConfigAPI
c: ConfigContainer
config = config  # type: ignore[name-defined] # noqa: F821,E501 pylint: disable=E0602,C0103
c = c  # type: ignore[name-defined] # noqa: F821,E501 pylint: disable=E0602,C0103

c.url.searchengines = searchengines.get_search_engines()
theme.set_theme(c)

# Make qutebrowser stop whining on startup
config.load_autoconfig(False)

# Keybindings
config.bind("<Ctrl-Shift-p>", "set-cmd-text -s :open -p")
config.bind("<Ctrl-t>", "set-cmd-text -s :open -t")

# Bookmarks
# Creating new bookmarks with M is default.
config.bind("b", "set-cmd-text -s :bookmark-load -t")
config.bind("B", "set-cmd-text -s :bookmark-load -t")
config.bind("E", "edit-text")

# Both upper and lower-case d/r are bound to close/reload tab respectively.
# We only need one binding for each option,
# so let's make it upper case to avoid mistakes.
config.bind("d", "bookmark-del {url}")
config.unbind("r")

# Do stuff with URLs
# ; for hints, , for current page.
mpv_cmd = f"mpv {Path.home()}/.local/share/mpv-logo.png"
config.bind(";t", "hint links spawn -v transmission-remote -a {hint-url}")
config.bind(";p", f"hint links spawn -dv {mpv_cmd} {{hint-url}}")
config.bind(",p", f"spawn -dv {mpv_cmd} {{url}}")

# Unbind key for creating macros
config.unbind("q")

c.qt.highdpi = True
c.tabs.background = True
c.content.autoplay = False
c.content.register_protocol_handler = False
c.auto_save.session = True
c.tabs.mousewheel_switching = False
c.tabs.wrap = False
c.qt.low_end_device_mode = "auto"
c.url.default_page = "about:blank"
c.downloads.location.directory = "~/downloads/"
c.confirm_quit = ["multiple-tabs"]
c.editor.command = ["alacritty", "-e", "nvim", "{}"]
c.window.title_format = "{perc}{current_title}{title_sep}"
c.zoom.levels = [
    "5%", "10%", "15%", "25%", "33%", "50%", "67%", "75%", "90%", "100%",
    "110%", "125%", "150%", "175%", "200%", "250%", "300%", "400%", "500%"
]
#c.content.cookies.accept = "no-3rdparty"
c.content.cookies.accept = "all"

# Dark mode rocks
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-hsl"
c.colors.webpage.darkmode.contrast = -.022
c.colors.webpage.darkmode.threshold.text = 150
c.colors.webpage.darkmode.threshold.background = 100
c.colors.webpage.darkmode.policy.images = "always"
c.colors.webpage.darkmode.grayscale.images = 0.35

# Previously enabled options that are disabled now.
# c.content.pdfjs               = False

# Enable JavaScript.
config.set("content.javascript.enabled", True, "file://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "qute://*/*")

# URL parameters to strip with `:yank url`.
c.url.yank_ignored_parameters = [
    "ref", "utm_source", "utm_medium", "utm_campaign",
    "utm_term", "utm_content", "fbclid"
]

# FONTS
c.fonts.default_family = [
    "SauceCodePro Nerd Font Mono", "Source Code Pro",
    "Ubuntu Monospace", "Monospace", "monospace"
]
c.fonts.completion.entry = "10pt monospace"
c.fonts.completion.category = "bold 12pt monospace"
c.fonts.debug_console = "10pt monospace"
c.fonts.downloads = "10pt monospace"
c.fonts.hints = "bold 10pt monospace"
c.fonts.keyhint = "10pt monospace"
c.fonts.messages.error = "10pt monospace"
c.fonts.messages.info = "10pt monospace"
c.fonts.messages.warning = "10pt monospace"
c.fonts.statusbar = "10pt monospace"
