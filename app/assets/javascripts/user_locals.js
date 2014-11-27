+function () {
  $(function () {

    $('.add-user').on('click', function (e) {
      $('.all-users').find('input:checkbox:checked').each(function (idx, obj) {
        $.ajax({
          url: $('.all-users').data('url'),
          data: {local: $('#local-id').data('id'), user: parseInt(obj.value)},
          dataType: 'json',
          type: 'put',
          success: function (data) {
            var row;

            row = $(obj).prop('checked', false).closest('tr').clone();
            row.appendTo('.local-users');
            $(obj).closest('tr').fadeOut(500, function () {
              $(this).remove();
            });
          }
        });
      });
    });

    $('.remove-user').on('click', function (e) {
      $('.local-users').find('input:checkbox:checked').each(function (idx, obj) {
        $.ajax({
          url: $('.local-users').data('url'),
          data: {local: $('#local-id').data('id'), user: parseInt(obj.value)},
          dataType: 'json',
          type: 'put',
          success: function (data) {
            var row;

            row = $(obj).prop('checked', false).closest('tr').clone();
            row.appendTo('.all-users');
            $(obj).closest('tr').fadeOut(500, function () {
              $(this).remove();
            });
          }
        });
      });
    });

  });
}();
