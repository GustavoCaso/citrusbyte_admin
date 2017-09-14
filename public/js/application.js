$(document).ready(function() {
  $(document).on('click', 'form p a.add-control', function(event){
    // Clone the element we want to insert
    controlInputClone = $(this).parents('form').children('.control-input').clone()
    // Remove disable inputs and make it visible in the form
    controlInputClone.children('input').prop("disabled", false)
    controlInputClone.children('select').prop("disabled", false)
    controlInputClone.css('display', 'block')
    // Insert the clone element in the form
    $(this).parent().before(controlInputClone[0])
  })
});
