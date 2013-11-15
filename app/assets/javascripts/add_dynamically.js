$(function() {
  $('#new-song').click(function(e) {
    console.log("Dynamically add function called");
    var song_template = '#song-template'
    var next_id = $('.songs .song').length;
    console.log("Next id: "+next_id);
    var html = $(song_template).html().replace(/\d+/g, next_id);
    $('.songs').append("<div class='song'>"+html+"</div>");
  });
});  

  