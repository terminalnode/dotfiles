# Input Methods
I only need a Japanese input method, and for that I've chosen to use `fcitx5`. The `5` is
important because the default `fcitx` package on Arch at the moment is some version of
Fcitx 4. The input method I use is SKK.

To install on Arch: `sudo pacman -S fcitx5 fcitx5-skk fcitx5-configtool skk-jisyo`

Then edit your environment variables to:
```sh
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
```
The arch wiki suggests putting this in `/etc/environment`, which is what I've done.

You will need to configure your input methods using `fcitx5-configtool`.
