(ns dystopia.views.upload
  (:require [dystopia.views.common :as common]
            [dystopia.hash :as hash]
            [clojure.java.io :as io]
            [noir.request :as r])
  (:use [noir.core :only [defpage]]
        [hiccup.core :only [html]]))

;;Should probably be an env var TODO
(def BOOK_DIR "/books/")

(def request (atom {}))

;;Simple proof on concept, TODO file type categorizing
(defpage [:post "/upload"] {:keys [book]}
  (println book))
  
;;  (let [ebook (io/file (:tempfile book))
;;        contents (slurp ebook)
;;        location (concat BOOK_DIR (hash/hexdigest contents))]
;;    (do
;;      (io/copy ebook (io/file name))
;;      (common/layout
;;       (html
;;        [:p "Thanks!"])))))
      