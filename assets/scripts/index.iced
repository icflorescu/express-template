$ ->
  $('h1').on 'click', ->
    console.log "Title clicked at: #{(new Date).toString()}"
