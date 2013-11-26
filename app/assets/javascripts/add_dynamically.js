var ready = function() {
  $('#new-song').click(function(e) {
    var song_template = '#song-template';
    var next_id = $('.songs .song').length;
    var html = $(song_template).html().replace(/\d+/g, next_id);
    $('.songs').append("<div class='song'>"+html+"</div>");
  });

    // TODO: only working for first artist!
  $('.edit-artist').click(function(e) {
    var member_id = $('.edit-artist').attr('member-id');
    console.log(member_id);
    var artist_info = $(".member[data-id= '"+member_id+"']");
    artist_info.css("display", "block");
  });

  $('#new-artist').click(function(e) {
    var artist_template = '#artist-template';
    var next_id = $('.members .member').length;
    var html = $(artist_template).html().replace(/_\d+/g, "_"+next_id).replace(/\[\d+/g, "["+next_id);
    $('.members').append("<div class='member'>"+html+"</div>");
  });

  $('#new-show').click(function(e) {
    var show_template = '#show-template';
    var next_id = $('.shows .show').length;
    var html = $(show_template).html().replace(/_\d+/g, "_"+next_id).replace(/\[\d+/g, "["+next_id);
    $('.shows').append("<div class='show'>"+html+"</div>");
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);