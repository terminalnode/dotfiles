# Keybindings
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('<Ctrl-Shift-p>', 'set-cmd-text -s :open -p') # Emulate Firefox binding
config.bind('<Ctrl-t>', 'set-cmd-text -s :open -t') # Defaults to creating new empty tab, which is useless.

# Bookmarks
# Creating new bookmarks with M is default.
config.bind('B', 'set-cmd-text -s :bookmark-load') # Defaults to :quickmark-load, which is useless.
config.bind('D', 'bookmark-del {url}') # Defaults to close tab, which is already done by lower-case d.

# Do stuff with URLs
# ; for hints, , for current page.
config.bind(';t', 'hint links spawn -v transmission-remote -a {hint-url}')
config.bind(';p', 'hint links spawn -dv mpv {hint-url}')
config.bind(',p', 'spawn -dv mpv {url}')

# Unbindings
config.unbind('q') # No need for macros in a browser.

c.qt.highdpi                        = True
c.tabs.background                   = True
c.content.autoplay                  = False
c.qt.low_end_device_mode            = 'auto'
c.url.default_page                  = 'about:blank'
c.downloads.location.directory      = '~/downloads/'
c.confirm_quit                      = ["multiple-tabs"]
c.editor.command                    = ['termite', '-e', 'vim {}']
c.window.title_format               = '{perc}{title}{title_sep}'
c.content.register_protocol_handler = False
c.auto_save.session                 = True

# Previously enabled options that are disabled now.
# c.content.pdfjs               = False

# Enable JavaScript.
config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# URL parameters to strip with `:yank url`.
c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content', 'fbclid']

# Set search engines
c.url.searchengines = {
    # Default search engine, with nothing else specified.
    "DEFAULT"   : "https://www.qwant.com/?q={}",
    # Arch stuff.
    # Wiki, AUR, general repositiories (pm for pacman).
    "aw"        : "https://wiki.archlinux.org/?search={}",
    "aur"       : "https://aur.archlinux.org/packages/?K={}",
    "pm"        : "https://www.archlinux.org/packages/?q={}",
    # Video streaming
    "vimeo"     : "https://vimeo.com/search?q={}",
    "yt"        : "https://www.youtube.com/results?search_query={}",
    # Google
    "play"      : "https://play.google.com/store/search?q={}",
    "drive"     : "https://drive.google.com/drive/search?q={}",
    "gmail"     : "https://mail.google.com/mail/u/0/#search/{}",
    # Generic search engines
    "ddg"       : "https://duckduckgo.com/?q={}",
    "q"         : "https://www.qwant.com/?q={}",
    "g"         : "https://www.google.com/search?q={}",
    "ecosia"    : "https://www.ecosia.org/search?q={}",
    # Specialised search engines
    "gimg"      : "https://www.google.com/search?tbm=isch&q={}",
    "maps"      : "https://www.google.se/maps/search/{}",
    "eniro"     : "https://kartor.eniro.se/?q={}",
    "wa"        : "http://www.wolframalpha.com/input/?i={}",
    "emoji"     : "https://emojipedia.org/search/?q={}",
    "imdb"      : "https://www.imdb.com/find?q={}",
    "rtomato"   : "https://www.rottentomatoes.com/search/?search={}",
    "bgg"       : "https://www.boardgamegeek.com/geeksearch.php?action=search&objecttype=boardgame&q={}",
    "gunda"     : "https://gu-se-primo.hosted.exlibrisgroup.com/primo-explore/search?query=any,contains,{}&vid=46GUB_VU1",
    "ebay"      : "https://www.ebay.com/sch/i.html?LH_PrefLoc=5&_nkw={}",
    "systemet"  : "https://www.systembolaget.se/sok-dryck/?searchquery={}",
    "bandcamp"  : "https://bandcamp.com/search?q={}",
    "fawe"      : "https://fontawesome.com/icons?d=gallery&q={}",
    "r/"        : "https://reddit.com/r/{}",
    # Warez
    "genlib"    : "http://gen.lib.rus.ec/search.php?req={}",
    "tpb"       : "https://thepiratebay.org/search/{}",
    "rarbg"     : "https://rarbg.to/torrents.php?search={}",
    # Dictionaries
    "fren"      : "http://www.larousse.fr/dictionnaires/rechercher?q={}&l=anglais-francais&culture=",
    "enfr"      : "http://www.larousse.fr/dictionnaires/rechercher?q={}&l=francais-anglais&culture=",
    "linguee"   : "http://www.linguee.com/english-french/search?source=french&query={}",
    "tyda"      : "http://tyda.se/search/{}",
    "ud"        : "http://www.urbandictionary.com/define.php?term={}",
    "dict"      : "http://www.dictionary.com/browse/{}",
    "kotoba"    : "https://tangorin.com/words?search={}",
    # Forvo
    "forvo"     : "https://forvo.com/search/{}",
    "forvi"     : "https://forvo.com/search/{}/fi/",
    "forvoja"   : "https://forvo.com/search/{}/ja/",
    "forvopl"   : "https://forvo.com/search/{}/pl/",
    # Wikipedia / Wikimedia
    "wen"       : "https://en.wikipedia.org?search={}",
    "wsv"       : "https://sv.wikipedia.org?search={}",
    "wja"       : "https://ja.wikipedia.org?search={}",
    "wfr"       : "https://fr.wikipedia.org?search={}",
    "wfi"       : "https://fi.wikipedia.org?search={}",
    "wpl"       : "https://pl.wikipedia.org?search={}",
    "wikt"      : "https://en.wiktionary.org?search={}",
    # Games
    "steam"     : "https://store.steampowered.com/search/?term={}",
    "gog"       : "https://www.gog.com/games?search={}",
    "eu4"       : "https://eu4.paradoxwikis.com?search={}",
    "rimworld"  : "https://rimworldwiki.com?search={}",
    "nethack"   : "https://nethackwiki.com/?search={}",
}

# FONTS
c.fonts.monospace               = '"Source Code Pro", "Ubuntu Monospace", Monospace, monospace'
c.fonts.completion.entry        = '10pt monospace'
c.fonts.completion.category     = 'bold 12pt monospace'
c.fonts.debug_console           = '10pt monospace'
c.fonts.downloads               = '10pt monospace'
c.fonts.hints                   = 'bold 10pt monospace'
c.fonts.keyhint                 = '10pt monospace'
c.fonts.messages.error          = '10pt monospace'
c.fonts.messages.info           = '10pt monospace'
c.fonts.messages.warning        = '10pt monospace'
c.fonts.statusbar               = '10pt monospace'

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

#########################
### COMPLETION WIDGET ###
#########################
## Color of the completion widget for odd/even rows.
c.colors.completion.odd.bg                      = nord['polar-2']
c.colors.completion.even.bg                     = nord['polar-2']
c.colors.completion.fg                          = nord['snow-1']
## Category headers.
c.colors.completion.category.bg                 = nord['polar-1']
c.colors.completion.category.fg                 = nord['snow-2']
c.colors.completion.category.border.top         = nord['polar-1']
c.colors.completion.category.border.bottom      = nord['polar-1']
## Selected completion item.
c.colors.completion.item.selected.bg            = nord['polar-4']
c.colors.completion.item.selected.fg            = nord['snow-3']
c.colors.completion.item.selected.border.top    = nord['polar-4']
c.colors.completion.item.selected.border.bottom = nord['polar-4']
## Scrollbar/scrollbar handle (in completion view)
c.colors.completion.scrollbar.bg                = nord['polar-2']
c.colors.completion.scrollbar.fg                = nord['snow-2']
## Matched text in the completion.
c.colors.completion.match.fg                    = nord['yellow']

#################
### DOWNLOADS ###
#################
## Color gradient interpolation system for download backgrounds.
##   - rgb/hsv/hsl: Interpolate in the RGB/HSV/HSL color system.
##   - none: Don't show a gradient.
c.colors.downloads.system.bg                    = 'none'

## Background color for the download bar.
c.colors.downloads.bar.bg                       = nord['polar-1']
## Color for downloads with errors.
c.colors.downloads.error.bg                     = nord['red']
c.colors.downloads.error.fg                     = nord['snow-2']
## Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg                      = nord['magenta']

#############
### HINTS ###
#############
c.colors.hints.bg                               = nord['yellow']
c.colors.hints.fg                               = nord['polar-1']
c.colors.hints.match.fg                         = nord['frost-4']
## Color of the keyhint widget.
c.colors.keyhint.bg                             = nord['polar-2']
c.colors.keyhint.fg                             = nord['snow-2']
## Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg                      = nord['yellow']

################
### MESSAGES ###
################
## Info messages
c.colors.messages.info.bg                       = nord['polar-1']
c.colors.messages.info.fg                       = nord['frost-2']
c.colors.messages.info.border                   = nord['frost-2']
## Error messages
c.colors.messages.error.bg                      = nord['polar-1']
c.colors.messages.error.fg                      = nord['red']
c.colors.messages.error.border                  = nord['red']
## Warning messages
c.colors.messages.warning.bg                    = nord['polar-1']
c.colors.messages.warning.fg                    = nord['orange']
c.colors.messages.warning.border                = nord['orange']

###############
### PROMPTS ###
###############
c.colors.prompts.bg                             = nord['polar-3']
c.colors.prompts.fg                             = nord['snow-2']
c.colors.prompts.selected.bg                    = nord['polar-4']
c.colors.prompts.border                         = '1px solid ' + nord['polar-1']

#################
### STATUSBAR ###
#################
## Color of the statusbar.
c.colors.statusbar.normal.bg                    = nord['polar-1']
c.colors.statusbar.normal.fg                    = nord['snow-2']
## In insert mode.
c.colors.statusbar.insert.bg                    = nord['green']
c.colors.statusbar.insert.fg                    = nord['polar-2']
## In private browsing mode.
c.colors.statusbar.private.bg                   = nord['polar-4']
c.colors.statusbar.private.fg                   = nord['snow-2']
## In passthrough mode.
c.colors.statusbar.passthrough.bg               = nord['frost-4']
c.colors.statusbar.passthrough.fg               = nord['snow-2']
## In caret mode.
c.colors.statusbar.caret.bg                     = nord['magenta']
c.colors.statusbar.caret.fg                     = nord['snow-2']
## [...] with a selection.
c.colors.statusbar.caret.selection.bg           = nord['magenta']
c.colors.statusbar.caret.selection.fg           = nord['snow-2']
## In command mode.
c.colors.statusbar.command.bg                   = nord['polar-3']
c.colors.statusbar.command.fg                   = nord['snow-2']
## [...] while private browsing
c.colors.statusbar.command.private.bg           = nord['polar-3']
c.colors.statusbar.command.private.fg           = nord['snow-2']
## Background color of the progress bar.        
c.colors.statusbar.progress.bg                  = nord['snow-2']
c.colors.statusbar.url.fg                       = nord['snow-2']
c.colors.statusbar.url.success.http.fg          = nord['snow-2']
c.colors.statusbar.url.success.https.fg         = nord['green']
c.colors.statusbar.url.error.fg                 = nord['red']
c.colors.statusbar.url.hover.fg                 = nord['frost-2']
c.colors.statusbar.url.warn.fg                  = nord['orange']

###############
### TAB BAR ###
###############
## Color gradient for the tab indicator.
##   - rgb/hsv/hsl: Interpolate in the RGB/HSV/HSL color system.
##   - none: Don't show a gradient.
c.colors.tabs.indicator.system                  = 'none'
c.colors.tabs.indicator.start                   = nord['yellow']
c.colors.tabs.indicator.stop                    = nord['green']
c.colors.tabs.indicator.error                   = nord['red']

## Default colours
c.colors.tabs.bar.bg                            = nord['polar-1']
## Selected tabs
c.colors.tabs.selected.even.bg                  = nord['polar-4']
c.colors.tabs.selected.odd.bg                   = nord['polar-4']
c.colors.tabs.selected.even.fg                  = nord['snow-2']
c.colors.tabs.selected.odd.fg                   = nord['snow-2']
## Unselected tabs
c.colors.tabs.even.bg                           = nord['polar-1']
c.colors.tabs.odd.bg                            = nord['polar-1']
c.colors.tabs.even.fg                           = nord['snow-2']
c.colors.tabs.odd.fg                            = nord['snow-2']

####################
# Stuff currently not in use. Stashed away in case I'll need it later.
####################

# Force software rendering for QtWebEngine. 
# Valid values:
#   - software-opengl: Tell LibGL to use a software implementation of GL (`LIBGL_ALWAYS_SOFTWARE` / `QT_XCB_FORCE_SOFTWARE_OPENGL`)
#   - qt-quick: Tell Qt Quick to use a software renderer instead of OpenGL. (`QT_QUICK_BACKEND=software`)
#   - chromium: Tell Chromium to disable GPU support and use Skia software rendering instead. (`--disable-gpu`)
#   - none: Don't force software rendering.
# c.qt.force_software_rendering = 'none'

## Background color for webpages if unset (or empty to use the theme's color)
# c.colors.webpage.bg = 'white'
