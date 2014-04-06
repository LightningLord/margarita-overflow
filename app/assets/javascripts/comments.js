$(document).ready(function() {

  $("#question_comment_button").on('click', function(e) {
    e.preventDefault();
    var form = $('#question_comment_form').clone().removeAttr( 'style class')
    $('#question_comments').append(form)
    $("#question_comment_button").hide();
  })

  $('#question_comments').on('click', 'input', function(event) {
    var self = this;
    event.preventDefault();
    var form = ($(this).parents('form').serialize());
    $.ajax({
      url: '/comments',
      type: 'POST',
      data: form
    }).done(function(response){
      $('#question_comments').empty();
      $('#question_comments').append(response)
    })
  })


});
