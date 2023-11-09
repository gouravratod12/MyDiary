$(document).on('turbolinks:load', function() {
  $('#product_select').on('change', function() {
    var productId = $(this).val();
    var productAttributes = $(this).closest('.fields').find( '#product_attributes');
    if (productId) {
      console.log("hello");
      $.ajax({
        url: '/products/' + productId + '/details.json',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
          console.log(data);
          productAttributes.show();
          $('#product_name').text(data.name);
          $('#product_rate').text(data.rate);
          $('#product_unit').text(data.unit);

        }
      });
    } else {
      $('#product_attributes').hide();
    }
  });
});