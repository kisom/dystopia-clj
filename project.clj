(defproject dystopia "0.1.0-preview"
            :description "Web-based front-end for an eBook library."
            :dependencies [[org.clojure/clojure "1.3.0"]
                           [noir "1.2.1"]
                           [clojureql "1.1.0-SNAPSHOT"]
                           [postgresql "9.0-801.jdbc4"]]
            :main dystopia.server)

