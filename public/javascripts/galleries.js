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

 $('#main-tabs-tabs li').live('click', function(e) {
   uploadify();
    e.preventDefault();
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

  function uploadify() {
    $('.fake-right-sidebar object#uploaderUploader').remove();

      $('.fake-right-sidebar #uploader').each(function() {
        if ($(this).closest('.tab-pane').is(':visible')) {
        gallery_id = $(this).parent().parent().parent().attr('id').slice(4);
        script_data = {};
        script_data[$('meta[name=csrf-param]').attr('content')] = $('meta[name=csrf-token]').attr('content');
        script_data[$(this).attr('data-session-key')] = $(this).attr('data-session-id');
        $(this).uploadify({
          uploader:     '/breeze/javascripts/uploadify/uploadify.swf',
          cancelImg:    '/breeze/images/icons/delete.png',
          buttonImg:    '/breeze/images/buttons/upload.png',
          width:        215,
          height:       40,
          multi:        true,
          auto:         true,
          script:       '/admin/galleries/galleries/' + gallery_id + '/images',
          scriptData:   script_data,
          fileDataName: 'file',
          wmode:        'transparent',
          folder:       '/', //'<%= @folder || "/" %>',
          fileExt:      '*.jpg;*.jpeg;*.gif;*.png',
          fileDesc:     'Image Files',
          
        
          onComplete: function(event, queue_id, file_obj, response, data) {
            var id = /id="([^"]+)"/.exec(response);
            if (id && id[1]) {
              $('#' + id[1]).remove();
            }
          
            $('#assets .image-assets').append(response);
            // show_or_hide_asset_section_headings();
            return true;
          }
        });
        }
      });
  }
