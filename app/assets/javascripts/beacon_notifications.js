+function () {
  $(function () {

    $('.add-notification').on('click', function (e) {
      debugger
      $('.all-notifications').find('input:checkbox:checked').each(function (idx, obj) {
        debugger
        $.ajax({
          url: $('.all-notifications').data('url'),
          data: {beacon: $('#beacon-id').data('id'), notification: parseInt(obj.value)},
          dataType: 'json',
          type: 'put',
          success: function (data) {
            var row;

            row = $(obj).prop('checked', false).closest('tr').clone();
            row.appendTo('.beacon-notifications');
            $(obj).closest('tr').fadeOut(500, function () {
              $(this).remove();
            });
          }
        });
      });
    });

    $('.remove-notification').on('click', function (e) {
      $('.beacon-notifications').find('input:checkbox:checked').each(function (idx, obj) {
        $.ajax({
          url: $('.beacon-notifications').data('url'),
          data: {beacon: $('#beacon-id').data('id'), notification: parseInt(obj.value)},
          dataType: 'json',
          type: 'put',
          success: function (data) {
            var row;

            row = $(obj).prop('checked', false).closest('tr').clone();
            row.appendTo('.all-notifications');
            $(obj).closest('tr').fadeOut(500, function () {
              $(this).remove();
            });
          }
        });
      });
    });

  });
}();
