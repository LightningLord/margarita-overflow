var Vote = {

  updateVote: function(){
    console.log("whattup");

    $('.vote-up-answer').on("ajax:complete", function(e, data, status, xhr){
      $('#answer_'+data.responseJSON.id.toString()).text(data.responseJSON.vote_count.toString());
    });

    $('.vote-down-answer').on("ajax:complete", function(e, data, status, xhr){
      $('#answer_'+data.responseJSON.id.toString()).text(data.responseJSON.vote_count.toString());
    });

    $('.vote-up-question').on("ajax:complete", function(e, data, status, xhr){
      $('#question_'+data.responseJSON.id.toString()).text(data.responseJSON.vote_count.toString());
    });

    $('.vote-down-question').on("ajax:complete", function(e, data, status, xhr){
      $('#question_'+data.responseJSON.id.toString()).text(data.responseJSON.vote_count.toString());
    });

  }

};

$(document).ready(function(){
  console.log("we are on");
  Vote.updateVote();

});


