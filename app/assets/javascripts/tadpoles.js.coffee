jQuery ->
  $('#tadpole_frog_id').parent().hide()
  frogs = $('#tadpole_frog_id').html()
  $('#tadpole_pond_id').change ->
    pond = $('#tadpole_pond_id :selected').text()
    escaped_pond = pond.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(frogs).filter("optgroup[label='#{escaped_pond}']").html()
    if options
      $('#tadpole_frog_id').html(options)
      $('#tadpole_frog_id').parent().show()
    else
      $('#tadpole_frog_id').empty()
      $('#tadpole_frog_id').parent().hide()



      