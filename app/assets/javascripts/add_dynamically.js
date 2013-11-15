$(function() {
  $('#new-song').click(function(e) {
    var song_template = '#song-template'
    var next_id = $('.songs .song').length;
    var html = $(song_template).html().replace(/\d+/g, next_id);
    $('.songs').append("<div class='song'>"+html+"</div>");
  });
});  

  