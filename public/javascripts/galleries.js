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

  $('.image a[rel=edit]').live('click', function() {
    gallery_editor( {
      url: this.href,
      ok: function(dialog) {
        $('form:visible', dialog).trigger('submit');
      }
    });
    return false;
  });

  function gallery_editor(options) {
    options = options || {};
    $.get(options.url, function(data) {
      $('<div></div>').html(data).dialog({
        title: 'Edit Image',
        modal: true,
        width: 752,
        height: 562,
        resizable: false,
        buttons: {
          Cancel: function() {
            $(this).dialog('close');
            $(this).empty().dialog('destroy');
          },
          OK: function() {
            if (options.ok) {
              options.ok(this);
            } else {
              $(this).dialog('close');
            }
          }
        },
        open: function() {
          open();
        }
      });
    });
  }
});
