
$(document).on('turbolinks:load', function() {
  $('#product_select').on('change', function() {
    var productId = $(this).val();
    var productFields = $(this).closest('.fields').find('.product-fields');

    if (productId) {
      $.ajax({
        url: '/products/' + productId + '/details',
        type: 'GET',
        dataType: 'json',
        cache: true,
        success: function(data) {
          productFields.show();
          $('#product_rate').val(data.rate);
          $('#unit').val(data.unit);
        }
      });
    } else {
      productFields.hide();
    }
  });
});
