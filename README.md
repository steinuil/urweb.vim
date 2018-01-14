# urweb.vim
Colorful vim syntax files for Ur/Web.

The syntax is mostly taken from Ur/Web's [lexer](https://github.com/urweb/urweb/blob/master/src/urweb.lex).

![screenshot of an Ur/Web file open in vim](https://github.com/steinuil/urweb.vim/raw/master/screenshot.png/)

*The font is [Iosevka](https://github.com/be5invis/iosevka) and the colorscheme is [gruvbox](https://github.com/morhetz/gruvbox).*

# Install
I use Pathogen, so that's what these instructions are for. Feel free to contribute with more.

First of all, install [Pathogen](https://github.com/tpope/vim-pathogen).

```
cd ~/.vim/bundle
git clone https://github.com/steinuil/urweb.vim
```

# Features
* More colors and colored elements than the other syntax files
* (Supposedly) correct syntax highlighting
* XML fragments highlighting (using vim's XML highlighter)
* Limited indentation support

This package currently just improves the looks. If you want features, try [vim-addon-urweb](https://github.com/MarcWeber/vim-addon-urweb).

# Known issues
* No differentiation between signature and implementation regions
* Possible weird behavior with single-quoted string literals
Example: ` 1'string ` is accepted by the compiler, but highlighted incorrectly in vim.
* No real recognition of SQL regions
