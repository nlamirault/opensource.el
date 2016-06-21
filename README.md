# opensource.el

[![Coverage Status](https://coveralls.io/repos/nlamirault/opensource.el/badge.png)](https://coveralls.io/r/nlamirault/opensource.el)

Master :
* [![MELPA Stable](https://stable.melpa.org/packages/opensource.el.svg)](https://stable.melpa.org/#/opensource.el)
* [![Circle CI](https://circleci.com/gh/nlamirault/opensource.el/tree/master.svg?style=svg)](https://circleci.com/gh/nlamirault/opensource.el/tree/master)

Develop:
* [![Melpa Status](https://melpa.org/packages/opensource.el-badge.svg)](https://melpa.org/#/opensource.el)
* [![Circle CI](https://circleci.com/gh/nlamirault/opensource.el/tree/develop.svg?style=svg)](https://circleci.com/gh/nlamirault/opensource.el/tree/develop)

Emacs client for the [Opensource API](https://api.opensource.org/)

## Installation

### Installation via package.el

`package.el` is the built-in package manager in Emacs.

*opensource.el* is available on the two major community maintained repositories -
[MELPA STABLE](https://stable.melpa.org), [MELPA](https://melpa.org).

You can install *opensource.el* with the following commnad:

<kbd>M-x package-install [RET] opensource [RET]</kbd>

or by adding this bit of Emacs Lisp code to your Emacs initialization file
(`.emacs` or `init.el`):

```el
(unless (package-installed-p 'opensource)
  (package-install 'opensource))
```

If the installation doesn't work try refreshing the package list:

<kbd>M-x package-refresh-contents [RET]</kbd>

Keep in mind that MELPA packages are built automatically from
the `master` branch, meaning bugs might creep in there from time to
time. Never-the-less, installing from MELPA is the recommended way of
obtaining *opensource.el*, as the `master` branch is normally quite stable and
"stable" (tagged) builds are released somewhat infrequently.

With the most recent builds of Emacs, you can pin *opensource.el* to always
use MELPA Stable by adding this to your Emacs initialization:

```el
(add-to-list 'package-pinned-packages '(opensource . "melpa-stable") t)
```

### Via el-get

[el-get](https://github.com/dimitri/el-get) is another popular package manager for Emacs. If you're an el-get
user just do <kbd>M-x el-get-install [RET] opensource [RET]</kbd>.

### Manual

You can install *opensource.el* manually by placing it on your `load-path` and
`require` ing it. Many people favour the folder `~/.emacs.d/vendor`.

```el
(add-to-list 'load-path "~/.emacs.d/vendor/")
(require 'opensource)
```

## Usage



## Development

### Cask

``opensource.el`` use [Cask][] for dependencies management.
Install it and retrieve dependencies :

    $ curl -fsSkL https://raw.github.com/cask/cask/master/go | python
    $ export PATH="$HOME/.cask/bin:$PATH"
    $ cask


### Tests

* Launch unit tests :

        $ make test


## Support / Contribute

See [here](CONTRIBUTING.md)


## Changelog

A changelog is available [here](ChangeLog.md).


## License

See [LICENSE](LICENSE).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>
