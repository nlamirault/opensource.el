;;; opensource-licenses.el --- Opensource licenses API.

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



(require 's)

(require 'opensource-http)



(defun opensource-list-licenses ()
  "Get a list of licenses."
  (opensource--perform-request "GET" "/licenses" nil 200))


(defun opensource-search-licenses (keyword)
  "Find all license by a `KEYWORD'."
  (opensource--perform-request "GET" (s-concat "/licenses/" keyword) nil 200))


(defun opensource-get-license (value)
  "Get a license by its OSI ID or by an identifier."
  (opensource--perform-request "GET" (s-concat "/license/" value) nil 200))


(provide 'opensource-licenses)
;;; opensource-licenses.el ends here
