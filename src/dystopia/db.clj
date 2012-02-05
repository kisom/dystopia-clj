(ns dystopia.db
  (use [clojureql.core]))

;; the korma db spec
;(defdb dystdb (postgres {:db "dystopia_db"
;                         :host "192.168.100.5"
;                         :port "5432"
;                         :user "dystusr"
;                         :password "test_user"}))

;; the clojureql def
(def db
  {:classname "com.postgresql