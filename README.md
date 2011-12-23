# A unite.vim plugin to find/open runtime scriptnames

    ------------- - ----------------------------------------------------------
    Plugin        : unite-scriptnames
    Author        : Zhao Cai < caizhaoff@gmail.com >
    URL           : https://github.com/zhaocai/unite-scriptnames
    Date Created  : Wed 21 Dec 2011 09:59:36 PM EST
    Last Modified : Thu 22 Dec 2011 10:21:33 PM EST
    ------------- - ----------------------------------------------------------

## Introduction

[unite-scriptnames][unite-scriptnames] is a [unite.vim][unite] plugin to
find/open runtime scriptnames. It is useful to quickly find and edit runtime scripts.

Requirement:

+ [unite.vim][unite]

Latest version: git://github.com/zhaocai/unite-scriptnames.git

## Installation

Before you start, please refer to the installation instruction from [unite.vim][unite] to install [unite.vim][unite] first.

To install [unite-scriptnames][unite-scriptnames] ( *and usually the same as installing other vim plugins* )

**Option A** - Without [Plugin Manager][vim-plugin-manager]

After you install Shougo's [unite.vim][unite], unarchive the zip file into a directory
that is under &rtp of your Vim, including ~/.vim dir.

**Option B** - With a [Plugin Manager][vim-plugin-manager] ( **recommanded** )

If you use plugin managers like *Pathogen*, *vundle*,
*neobundle*, *vim-addon-manager*, etc., just unarchive the zip file or clone the
[unite-scriptnames][unite-scriptnames] repo from
`git://github.com/zhaocai/unite-scriptnames.git` into your local plugin installation directory
(most likely `~/.vim/bundle/`). Then add corresponding command in .vimrc for the
bundle manager you are using.


**Example**:

1. *vundle*:

    Bundle 'zhaocai/unite-scriptnames'

2. *neobundle*:

    NeoBundle 'zhaocai/unite-scriptnames'

3. *vim-addon-manager*:

    call vam#ActivateAddons(['unite-scriptnames'], {'auto_install' : 0})



## Usage

    :Unite scriptnames

[unite]: https://github.com/Shougo/unite.vim
[unite-scriptnames]: https://github.com/zhaocai/unite-scriptnames
[vim-plugin-manager]: http://vim-scripts.org/vim/tools.html "Vim Plugin Manangers"
