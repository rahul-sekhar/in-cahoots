$ = jQuery
$(document).on 'page:load', ->
  $('#project .info').stick_in_parent({
    bottoming: false
  })
