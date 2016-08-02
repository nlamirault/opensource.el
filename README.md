# opensource.el

[![Coverage Status](https://coveralls.io/repos/nlamirault/opensource.el/badge.png)](https://coveralls.io/r/nlamirault/opensource.el)

Master :
* [![MELPA Stable](https://stable.melpa.org/packages/opensource.svg)](https://stable.melpa.org/#/opensource)
* [![Circle CI](https://circleci.com/gh/nlamirault/opensource.el/tree/master.svg?style=svg)](https://circleci.com/gh/nlamirault/opensource.el/tree/master)

Develop:
* [![Melpa Status](https://melpa.org/packages/opensource-badge.svg)](https://melpa.org/#/opensource)
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

### Get a list of all licenses

```el
ELISP> (opensource-list-licenses)
[((id . "AAL")
  (identifiers .
               [((identifier . "AAL")
                 (scheme . "SPDX"))
                ((identifier . "License :: OSI Approved :: Attribution Assurance License")
                 (scheme . "Trove"))])
  (links .
         [((note . "OSI Page")
           (url . "https://opensource.org/licenses/AAL"))])
  (name . "Attribution Assurance License")
  (other_names .
               [])
  (superseded_by)
  (keywords .
            ["osi-approved" "discouraged" "redundant"])
  (text .
        [((media_type . "text/html")
          (title . "HTML")
          (url . "https://opensource.org/licenses/AAL"))]))
 ((id . "AFL-3.0")
  (identifiers .
               [((identifier . "AFL-3.0")
                 (scheme . "SPDX"))
                ((identifier . "License :: OSI Approved :: Academic Free License (AFL)")
                 (scheme . "Trove"))])
  (links .
         [((note . "OSI Page")
           (url . "https://opensource.org/licenses/AFL-3.0"))])
  (name . "Academic Free License, Version 3.0")
  (other_names .
               [])
  (superseded_by)
  (keywords .
            ["osi-approved" "discouraged" "redundant"])
  (text .
        [((media_type . "text/html")
          (title . "HTML")
          (url . "https://opensource.org/licenses/AFL-3.0"))]))

[...]
```

### Find all licenses by a keyword

```el
ELISP> (opensource-search-licenses "obsolete")
[((id . "Apache-1.1")
  (identifiers .
               [((identifier . "Apache-1.1")
                 (scheme . "SPDX"))])
  (links .
         [((note . "OSI Page")
           (url . "https://opensource.org/licenses/Apache-1.1"))])
  (name . "Apache Software License, Version 1.1")
  (other_names .
               [])
  (superseded_by . "Apache-2.0")
  (keywords .
            ["discouraged" "obsolete" "osi-approved"])
  (text .
        [((media_type . "text/html")
          (title . "HTML")
          (url . "https://opensource.org/licenses/Apache-1.1"))]))
 ((id . "Artistic-1.0")
  (identifiers .
               [((identifier . "Artistic-1.0")
                 (scheme . "DEP5"))
                ((identifier . "Artistic-1.0")
                 (scheme . "SPDX"))])
  (links .
         [((note . "OSI Page")
           (url . "https://opensource.org/licenses/Artistic-1.0"))])
  (name . "Artistic License, Version 1.0")
  (other_names .
               [])
  (superseded_by . "Artistic-2.0")
  (keywords .
            ["osi-approved" "discouraged" "obsolete"])
  (text .
        [((media_type . "text/html")
          (title . "HTML")
          (url . "https://opensource.org/licenses/Artistic-1.0"))]))

[...]
```

### Get a license

```el
ELISP> (opensource-get-license "Apache-2.0")
((id . "Apache-2.0")
 (identifiers .
              [((identifier . "Apache-2.0")
                (scheme . "DEP5"))
               ((identifier . "Apache-2.0")
                (scheme . "SPDX"))
               ((identifier . "License :: OSI Approved :: Apache Software License")
                (scheme . "Trove"))])
 (links .
        [((note . "tl;dr legal")
          (url . "https://tldrlegal.com/license/apache-license-2.0-%28apache-2.0%29"))
         ((note . "Wikipedia page")
          (url . "https://en.wikipedia.org/wiki/Apache_License"))
         ((note . "OSI Page")
          (url . "https://opensource.org/licenses/Apache-2.0"))])
 (name . "Apache License, Version 2.0")
 (other_names .
              [])
 (superseded_by)
 (keywords .
           ["osi-approved" "popular" "permissive"])
 (text .
       [((media_type . "text/html")
         (title . "HTML")
         (url . "https://www.apache.org/licenses/LICENSE-2.0"))]))
```


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
