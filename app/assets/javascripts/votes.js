var Vote = {

  updateVote: function(){
    $('.vote-up-off').on('ajax:success',function(e, data, status, xhr){
      console.log(data);
      $('#vote-count').text(data.vote_count.toString());
    });
  }

};

$(document).ready(function(){
  console.log("we are on");
  Vote.updateVote();

});


