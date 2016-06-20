;;; opensource-version.el --- Opensource Emacs client version

;; Copyright (C) 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at

;;     http://www.apache.org/licenses/LICENSE-2.0

;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;;; Commentary:

;;; Code:

(require 'dash)
(require 'pkg-info)
(require 's)


(defun opensource--library-version ()
  "Get the version in the opensource client header."
  (-when-let (version (pkg-info-library-version 'opensource))
    (pkg-info-format-version version)))


;;;###autoload
(defun opensource-version (&optional show-version)
  "Get the opensource version as string.
If called interactively or if SHOW-VERSION is non-nil, show the
version in the echo area and the messages buffer.
The returned string includes both, the version from package.el
and the library version, if both a present and different.
If the version number could not be determined, signal an error,
if called interactively, or if SHOW-VERSION is non-nil, otherwise
just return nil."
  (interactive (list (not (or executing-kbd-macro noninteractive))))
  (let* ((version (opensource--library-version)))
    (unless version
      (error "Could not find out opensource version"))
    (message "opensource %s" version)
    version))


(provide 'opensource-version)
;;; opensource-version.el ends here
