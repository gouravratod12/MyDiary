$(document).on('turbolinks:load', function() {
  $('#product-select').change(function() {
    var selectedProduct = $(this).val();
    console.log("id is", selectedProduct );
    if (selectedProduct) {
      $.ajax({
        url: '/products/fetch_info',
        type: 'GET',
        data: { product_name: selectedProduct },
        success: function(response) {
          console.log("rate", response.rate);  // Updated: 'response.rate' instead of 'response.product_rate'
          console.log("unit", response.unit);
          $('#rate-field').val(response.rate);  // Updated: 'response.rate' instead of 'response.product_rate'
          $('#unit-field').val(response.unit);
        },
        error: function() {
          // Handle errors if the product is not found
        }
      });
    } else {
      // Handle the case where no product is selected
      $('#rate-field').val('');
      $('#unit-field').val('');
    }
  });
});
