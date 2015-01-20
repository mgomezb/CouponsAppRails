+function () {
  $(function () {

    $('.add-coupon').on('click', function (e) {
      debugger
      $('.all-coupons').find('input:checkbox:checked').each(function (idx, obj) {
        debugger
        $.ajax({
          url: $('.all-coupons').data('url'),
          data: {beacon: $('#beacon-id').data('id'), coupon: parseInt(obj.value)},
          dataType: 'json',
          type: 'put',
          success: function (data) {
            var row;

            row = $(obj).prop('checked', false).closest('tr').clone();
            row.appendTo('.beacon-coupons');
            $(obj).closest('tr').fadeOut(500, function () {
              $(this).remove();
            });
          }
        });
      });
    });

    $('.remove-coupon').on('click', function (e) {
      $('.beacon-coupons').find('input:checkbox:checked').each(function (idx, obj) {
        $.ajax({
          url: $('.beacon-coupons').data('url'),
          data: {beacon: $('#beacon-id').data('id'), coupon: parseInt(obj.value)},
          dataType: 'json',
          type: 'put',
          success: function (data) {
            var row;

            row = $(obj).prop('checked', false).closest('tr').clone();
            row.appendTo('.all-coupons');
            $(obj).closest('tr').fadeOut(500, function () {
              $(this).remove();
            });
          }
        });
      });
    });

  });
}();
