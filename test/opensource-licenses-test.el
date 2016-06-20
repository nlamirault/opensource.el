;;; opensource-licenses-test.el --- Tests for the Opensource licenses API.

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


(ert-deftest test-opensource-list-licenses ()
  :tags '(licenses)
  (with-test-sandbox
   (let ((licenses (opensource-list-licenses)))
     ;;(message "Opensource list licenses : %s" licenses)
     (should (< 0 (length licenses)))
     (mapcar (lambda (license)
               ;; (message "%s" license)
               (should-not (s-blank? (assoc-default 'name license)))
               (should-not (s-blank? (assoc-default 'id license)))
               )
             licenses))))


(ert-deftest test-opensource-search-licenses ()
  :tags '(licenses current)
  (with-test-sandbox
   (let ((licenses (opensource-search-licenses "copyleft")))
     (message "Opensource list licenses : %s" licenses)
     (should (< 0 (length licenses)))
     (mapcar (lambda (license)
               (message "%s" license)
               (should-not (s-blank? (assoc-default 'name license)))
               (should-not (s-blank? (assoc-default 'id license)))
               (should (< 0 (length (assoc-default 'keywords license))))
               )
             licenses))))


(ert-deftest test-opensource-get-valid-license ()
  :tags '(licenses)
  (with-test-sandbox
   (let ((license (opensource-get-license "Apache-2.0")))
     (message "Opensource license : %s" license)
     (should (string= "Apache-2.0" (assoc-default 'id license)))
     (should (string= "Apache License, Version 2.0" (assoc-default 'name license))))))


(ert-deftest test-opensource-get-unknown-license ()
  :tags '(licenses)
  (with-test-sandbox
   (should-error (opensource-get-license "TheInvalidLicense")
                 :type 'opensource-http-error)))


(provide 'opensource-licenses-test)
;;; opensource-licenses-test.el ends here
