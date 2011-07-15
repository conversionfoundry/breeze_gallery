$(function() {
  $('#left #galleries a').live('click', function() {
    open_tab($(this).attr('data-id'), this.href, {
      title: $('strong', this).text(),
      close: true
    });
    return false;
  });

  $('#right .new.gallery.button').click(function() {
    open_tab('new_gallery', this.href, {
      title: 'New gallery',
      close: true
    });
    return false;
  });
});
