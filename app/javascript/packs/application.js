// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "@fortawesome/fontawesome-free/css/all";
import "../stylesheets/application";
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("bootstrap")
require("trix")
require("@rails/actiontext")

document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})

document.addEventListener('turbolinks:load', () =>{
    document.querySelector('[data-bs-toggle="offcanvas"]').addEventListener('click', function () {
        document.querySelector('.offcanvas-collapse').classList.toggle('open')
    })
})

window.addEventListener("trix-file-accept", function(event) {
    event.preventDefault()
    alert("File attachment not supported!")
})