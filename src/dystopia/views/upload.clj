(ns dystopia.views.upload
  (:require [dystopia.views.common :as common]
            [dystopia.hash :as hash]
            [clojure.java.io :as io]
            [noir.request :as r])
  (:use [noir.core :only [defpage]]
        [hiccup.core :only [html]]))

;;Should probably be an env var TODO
(def BOOK_DIR "/books/")

;;Not implemented yet, should pull the filetype from the end of
;;the filename so we can sort it into folders and append to the
;;end of the generated name.
(defn getFiletype
  "Tries to get the filetype from the filename."
  [filename]
  ())

;;TODO: update database info once that's set up.

(defpage [:post "/upload"] {:keys [book]}
  (let [ebook (io/file (:tempfile book))
        contents (slurp ebook)
        location (apply str (concat BOOK_DIR (hash/hexdigest contents)))]
    (do
      (println location)
      (io/copy ebook (io/file location))
      (common/layout
       (html
        [:p "Thanks!"])))))
