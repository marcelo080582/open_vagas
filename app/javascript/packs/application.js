// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'bootstrap'
import './src/application.scss'


$(function () {
  'use strict'

  $('[data-toggle="offcanvas"]').on('click', function () {
    $('.offcanvas-collapse').toggleClass('open')
  })
})

require("trix")
require("@rails/actiontext")

$(document).on('ready turbolinks:load', function(){
  if ($('.count-textarea').length > 0) {
    $('#current').text($('.count-textarea').val().length);
    $('.count-textarea').keyup(function(){
      var characterCount = $(this).val().length;
      $('#current').text(characterCount);
    });
  }

  $('.copy-url').click(function(e){
    e.preventDefault();
    var url = $(this).attr('data-clipboard-text');
    navigator.clipboard.writeText(url);
    alert('URL copiada com sucesso.')
  })
});
