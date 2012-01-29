(ns dystopia.views.users
  (:require [dystopia.views.common :as common]
            [noir.response :as resp])
  (:use [noir.core :only [defpage defpartial]]
        [hiccup.core :only [html]]
        [hiccup.page-helpers]
        [hiccup.form-helpers]))

(defn valid-login-form? [{:keys [email password]}]
  true)

(defpartial login-form [{:keys [email password]}]
  (label "email" "Email Address: ")
  (text-field "email" email)
  (label "password" "Password:")
  (text-field "password" password))

(defpage  [:any "/login"] {:as user}
  (if (valid-login-form? user)
    (common/layout
     (form-to [:post "/login"]
              (login-form user)
              (submit-button "Login")))))

(defpage "/" []
  (common/layout
   (html
    [:p "Hello!"])))