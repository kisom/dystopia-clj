(ns dystopia.hash
  (:use [clojure.contrib.str-utils])
  (:import [java.security MessageDigest]))

(def ^{:dynamic true} *default-hash* "SHA-256")

;; take from http://ideone.com/MoNJ14Z8 which was, in turn, gathered from
;; Tom Lee's post "Clojure and MessageDigest"
;;     (http://tomlee.co/2009/06/clojure-and-messagedigest/)
(defn hexdigest
  "Returns the hex digest of an object. Expects a string as input."
  ([input] (hexdigest input *default-hash*))
  ([input hash-algo]
     (if (string? input)
       (let [hash (MessageDigest/getInstance hash-algo)]
         (. hash update (.getBytes input))
         (let [digest (.digest hash)]
           (apply str (map #(format "%02x" (bit-and % 0xff)) digest))))
       (do
         (println "Invalid input! Expected string, got" (type input))
         nil))))

(defn compare-sha256 [obj ref-hash]
  "Compare an object to a hash; true if (= (hash obj) ref-hash)."
  (= ref-hash (hexdigest obj "SHA-256")))

(def sha256 (fn [input] (hexdigest input "SHA-256")))
