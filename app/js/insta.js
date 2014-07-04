// Instantiate an empty object.

var Instagram  = {};
var Tag        = 'prokatvrostove';
var cMaxID     = '';
var cStop      = false;
var cHash      = Math.floor(Math.random() * 9999) + 1;
var cHashLast  = 0;
var cStep      = 0;
this.Instagram = Instagram
// Small object for holding important configuration data.
Instagram.Config = {
  clientID: 'ab745d68e4094d7fad2d54471e1b6ff6',
  apiHost: 'https://api.instagram.com'
};

// Quick and dirty templating solution.
Instagram.Template = {};
Instagram.Template.Views = {

  "photo": '<div class="item h' + cHash + '"><a href="{url}" title="{title}" target="_blank"><img  src="{photo}" style="display:none;" onload="Instagram.App.showPhoto(this);"></a></div>'
};

Instagram.Template.generate = function(template, data){
  var re, resource;

  template = Instagram.Template.Views[template];
  for(var attribute in data){
    re = new RegExp("{" + attribute + "}","g");
    template = template.replace(re, data[attribute]);
  }
  return template;
};

// ************************
// ** Main Application Code
// ************************
(function(){

  function init(){
    bindEventHandlers();
  }

  function toTemplate(photo){
    if (photo.caption)
      {var name = photo.caption.from.username}
    else
      {var name = "anonimous"}
    photo = {
      count: photo.likes.count,
      avatar: photo.user.profile_picture,
      photo: photo.images.low_resolution.url,
      url: photo.link,
      title: "via "+name
    };

    return Instagram.Template.generate('photo', photo);
  }

  function toScreen(photos){
    var photos_html = '';

    $('.paginate a').attr('data-max-tag-id', photos.pagination.next_max_id)
                    .fadeIn();

    $.each(photos.data, function(index, photo){

    if ( 0 == $('.clImgList item a[href="' + photo.link + '"]').length )
        $('div.clImgList').append( toTemplate(photo) );
    });

  //$('div.clImgList').append(photos_html);
  }


  function generateResource(tag){
    var config = Instagram.Config, url;

    if(typeof tag === 'undefined'){
      throw new Error("Resource requires a tag. Try searching for cats!");
    } else {
      // Make sure tag is a string, trim any trailing/leading whitespace and take only the first
      // word, if there are multiple.
      tag = String(tag).trim().split(" ")[0];
    }

    url = config.apiHost + "/v1/tags/" + tag + "/media/recent?callback=?&client_id=" + config.clientID;

    return function(max_id){
      var next_page;
      if(typeof max_id === 'string' && max_id.trim() !== '') {
        next_page = url + "&max_id=" + max_id;
      }
      return next_page || url;
    };
  }

  function paginate(max_id){
    $.getJSON(generateUrl(tag), toScreen);
  }

  function search(tag){
    resource = generateResource(tag);
    $('.paginate a').hide();
    $('#photos-wrap *').remove();
    fetchPhotos();
  }

  function fetchPhotos(max_id){
    if ( cMaxID != max_id ) {
    cStep++;
      $.getJSON(resource(max_id), toScreen);
      if ( max_id )
        cMaxID = max_id;
  } else {
    cStop = false;
    return false;
  }
  }

  function bindEventHandlers(){
    $('body').on('click', '.paginate a.button', function(){
      var tagID = $(this).attr('data-max-tag-id');

      fetchPhotos(tagID);
      return false;
    });

    // Bind an event handler to the `click` event on the form's button
    /*$('form#search button').click(function(){
      // Extract the value of the search input text field.
      var tag = $('input.search-tag').val();

      // Invoke `search`, passing `tag`.
      search(tag);

      // Stop event propagation.
      return false;
    });
    */
  }

  function showPhoto(p){
    $(p).fadeIn();
  }

  Instagram.App = {
    search: search,
    showPhoto: showPhoto,
    init: init
  };
})();

$(function(){


  Instagram.App.init();

  var doReload = function() {

    cHashLast  = cHash;
    cMaxID     = ''; cStop = false;
    cHash      = Math.floor(Math.random() * 9999) + 1;

    var cObjects = $('div.clImgList item.h' + cHashLast);

    if ( 0 < $(cObjects).length ) {
      $('div.clImgList').animate({'opacity': 1}, 500);
      $('.paginate a.button').attr({'data-max-tag-id': ''});
    }

    $(cObjects).remove();
    fGetRecentTagged();
  }

  var fGetRecentTagged = function() {

        setTimeout( function() {

            Instagram.App.search(Tag);

              var doSearch = function() {

                $('.paginate a.button').click();
                if ( !cStop )
                    setTimeout( function() { doSearch(); }, 50 );
              };
              setTimeout( function() { doSearch(); }, 100 );
        }, 500 );
        /*if ( 10 > cStep )
          setTimeout( function() { doReload(); }, 300000 );*/
  };
  fGetRecentTagged();
});




/*
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ru_RU/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
*/