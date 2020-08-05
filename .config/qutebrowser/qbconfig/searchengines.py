from typing import Dict


def get_search_engines() -> Dict[str, str]:
    return {
        # Default search engine, with nothing else specified.
        "DEFAULT":    "https://duckduckgo.com/?q={}",
        # Generic search engines
        "ddg":        "https://duckduckgo.com/?q={}",
        "q":          "https://www.qwant.com/?q={}",
        "g":          "https://www.google.com/search?q={}",
        "ecosia":     "https://www.ecosia.org/search?q={}",
        # Google
        "play":       "https://play.google.com/store/search?q={}",
        "drive":      "https://drive.google.com/drive/search?q={}",
        "gmail":      "https://mail.google.com/mail/u/0/#search/{}",
        # ArchLinux
        "aw":         "https://wiki.archlinux.org/?search={}",
        "aur":        "https://aur.archlinux.org/packages/?K={}",
        "pm":         "https://www.archlinux.org/packages/?q={}",
        # Programming
        "hoogle":     "https://hoogle.haskell.org/?hoogle={}",
        "npm":        "https://www.npmjs.com/search?q={}",
        "pypi":       "https://pypi.org/search/?q={}",
        "pydoc":      "https://docs.python.org/3.8/search.html?q={}",
        "rudoc":      "https://ruby-doc.com/search.html?q={}",
        "maven":      "https://mvnrepository.com/search?q={}",
        "gem":        "https://rubygems.org/search?utf8=%E2%9C%93&query={}",
        "cc":         "https://search.creativecommons.org/search?q={}",
        # Dictionaries
        "tyda":       "http://tyda.se/search/{}",
        "ud":         "http://www.urbandictionary.com/define.php?term={}",
        "dict":       "http://www.dictionary.com/browse/{}",
        "etym":       "https://www.etymonline.com/search?q={}",
        # Dictionaries => French
        "fren":       "https://www.larousse.fr/dictionnaires/francais-anglais/{}",  # noqa: E501
        "enfr":       "https://www.larousse.fr/dictionnaires/anglais-francais/{}",  # noqa: E501
        "fr":         "https://www.larousse.fr/dictionnaires/francais/{}",
        "frco":       "https://www.larousse.fr/conjugaison/francais/{}",
        "linguee":    "http://www.linguee.com/english-french/search?source=french&query={}",  # noqa: E501
        # Dictionaries => Japanese
        "kotoba":     "https://jisho.org/search/{}",
        "jisho":      "https://jisho.org/search/{}",
        "tangorin":   "https://tangorin.com/words?search={}",
        "weblio":     "https://www.weblio.jp/content/{}",
        # Dictionaries => Forvo
        "forvo":      "https://forvo.com/search/{}",
        "forvi":      "https://forvo.com/search/{}/fi/",
        "forvoja":    "https://forvo.com/search/{}/ja/",
        "forvopl":    "https://forvo.com/search/{}/pl/",
        # Wikipedia / Wikimedia
        "wen":        "https://en.wikipedia.org?search={}",
        "wsv":        "https://sv.wikipedia.org?search={}",
        "wja":        "https://ja.wikipedia.org?search={}",
        "wfr":        "https://fr.wikipedia.org?search={}",
        "wfi":        "https://fi.wikipedia.org?search={}",
        "wpl":        "https://pl.wikipedia.org?search={}",
        "wikt":       "https://en.wiktionary.org?search={}",
        # Games
        "nooki":      "https://nookipedia.com/w/index.php?search={}",
        "steam":      "https://store.steampowered.com/search/?term={}",
        "protondb":   "https://www.protondb.com/search?q={}",
        "gog":        "https://www.gog.com/games?search={}",
        "eu4":        "https://eu4.paradoxwikis.com?search={}",
        "rimworld":   "https://rimworldwiki.com?search={}",
        "nethack":    "https://nethackwiki.com/?search={}",
        # Uncategorised
        "gimg":       "https://www.google.com/search?tbm=isch&q={}",
        "maps":       "https://www.google.se/maps/search/{}",
        "eniro":      "https://kartor.eniro.se/?q={}",
        "wa":         "http://www.wolframalpha.com/input/?i={}",
        "emoji":      "https://emojipedia.org/search/?q={}",
        "imdb":       "https://www.imdb.com/find?q={}",
        "rtomato":    "https://www.rottentomatoes.com/search/?search={}",
        "bgg":        "https://www.boardgamegeek.com/geeksearch.php?action=search&objecttype=boardgame&q={}",  # noqa: E501
        "gunda":      "https://gu-se-primo.hosted.exlibrisgroup.com/primo-explore/search?query=any,contains,{}&vid=46GUB_VU1",  # noqa: E501
        "ebay":       "https://www.ebay.com/sch/i.html?LH_PrefLoc=5&_nkw={}",
        "systemet":   "https://www.systembolaget.se/sok-dryck/?searchquery={}",
        "bandcamp":   "https://bandcamp.com/search?q={}",
        "fawe":       "https://fontawesome.com/icons?d=gallery&q={}",
        "r":          "https://reddit.com/r/{}",
        "giphy":      "https://giphy.com/search/{}",
        "genlib":     "http://gen.lib.rus.ec/search.php?req={}",
        "daddict":    "https://wiki.d-addicts.com?search={}",
        "vimeo":      "https://vimeo.com/search?q={}",
        "yt":         "https://www.youtube.com/results?search_query={}",
    }
