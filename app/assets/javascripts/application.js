//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require blocs
//= require jssocials
//= require kakao
//= require jquery.youtubebackground
//= require unobtrusive_flash
//= require unobtrusive_flash_bootstrap

Kakao.init('929bb882ab44bacf4c2c27a9de2156c6');

$.is_blank = function (obj) {
  if (!obj || $.trim(obj) === "") return true;
  if (obj.length && obj.length > 0) return false;

  for (var prop in obj) if (obj[prop]) return false;
  return true;
}

$.inno_apply = function($base, query, callback) {
  $.each($base.find(query), function(i, elm){
    callback(elm);
  });
}

var inno_prepare = function($base) {
  $.inno_apply($base, '[data-action="inno-share"]', function(elm) {
    var $elm = $(elm);

    var url = $elm.data('share-url');
    var sitename = $elm.data('share-sitename');
    var text = $elm.data('share-text');
    var share = $elm.data('share-provider');
    var logo = $elm.data('share-logo');
    var css = $elm.data('share-css');
    if ($.is_blank(share)) return;
    var image_url = $elm.data('share-image');
    var image_width = $elm.data('share-image-width');
    var image_height = $elm.data('share-image-height');

    switch(share) {
    case 'kakao-link':
      Kakao.Link.createTalkLinkButton({
        container: elm,
        label: text,
        image: {
          src: image_url,
          width: image_width,
          height: image_height
        },
        webLink: {
          text: sitename + '에서 보기',
          url: url
        }
      });
    break
    case 'kakao-story':
      $elm.on('click', function(e) {
        Kakao.Story.share({
          url: url,
          text: text
        });
      });
    break
    default:
      $elm.jsSocials({
        showCount: false,
        showLabel: false,
        shares: [{share: share, logo: logo, css: css}],
        text: text,
        url: url
      });
    }
  });
};






$(function(){
  inno_prepare($('body'));
  $('#video-background').YTPlayer({
      fitToBackground: true,
      videoId: 'lkswzF9jA5w'
  });

  /**
  *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
  *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
  /*
  var disqus_config = function () {
  this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
  this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
  };
  */

  var d = document, s = d.createElement('script');
  s.src = '//innovators-1.disqus.com/embed.js';
  s.setAttribute('data-timestamp', +new Date());
  (d.head || d.body).appendChild(s);
});
