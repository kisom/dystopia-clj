(ns dystopia.views.welcome
  (:require [dystopia.views.common :as common])
  (:use [noir.core :only [defpage]]
        [hiccup.core :only [html]]
        [hiccup.form-helpers]))

(defpage "/welcome" []
         (common/layout
          [:p "Welcome to dystopia"]
          [:p "Upload a book"]
          (form-to [:post "/upload"]
                   (file-upload :book)
                   (submit-button "Upload"))))
