(ns dystopia.books
  (:use [clojure.string :only [join]])
  (:require [dystopia.hash]))

(def ^{:dynamic true} *book-path* "books")

(defn book-path [path format]
  (let [digest (dystopia.hash/sha256 (slurp path))]
    (join "/" [*book-path* (:extension format)
               (join "." [digest (:extension format)])])))
