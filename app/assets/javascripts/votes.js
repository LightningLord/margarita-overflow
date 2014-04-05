var Vote = {

  updateVote: function(){
    console.log("whattup");

    $('.vote-up-off').on("ajax:complete", function(e, data, status, xhr){
      $('#vote-count').text(data.responseJSON.vote_count.toString());
    });

    $('.vote-down-off').on("ajax:complete", function(e, data, status, xhr){
      $('#vote-count').text(data.responseJSON.vote_count.toString());
    });

  }

};

$(document).ready(function(){
  console.log("we are on");
  Vote.updateVote();

});


