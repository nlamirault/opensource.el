;;; opensource-http.el --- HTTP tools

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

(require 'json)

(require 'request)
(require 's)

(require 'opensource-api)
(require 'opensource-version)

(defun opensource--get-rest-uri (uri)
  "Retrieve the Opensource API complete url.
`URI` is the api path."
  (s-concat opensource--host uri))


(defun opensource--get-headers ()
  "Return the HTTP headers for Gitlab API."
  (list (cons "User-Agent"
              (s-concat opensource--user-agent
                        "/"
                        (opensource--library-version)))
        (cons "Accept" "application/json")))


(defun opensource--perform-get-request (uri params)
  "Perform an HTTP request to the Opensource API endpoint."
  (let* ((response (request (opensource--get-rest-uri uri)
                            :type "GET"
                            :headers (opensource--get-headers)
                            :sync t
                            :params params
                            ;;:data params
                            :parser 'json-read)))
    response))


(defun opensource--perform-request (type uri params status-code)
  "Doc string TYPE URI PARAMS STATUS-CODE."
  (let ((response
         (opensource--perform-get-request uri params)))
    (if (= status-code (request-response-status-code response))
        (request-response-data response)
      (signal 'opensource-http-error
              (list (request-response-status-code response)
                    (request-response-data response))))))


(provide 'opensource-http)
;;; opensource-http.el ends here
