$(document).on('turbolinks:load', function() {
  $('#product_weight').on('change', function() {
    // Get the product ID
    var productId = $(this).val();

    // Get the product attributes
    var productAttributes = $(this).closest('.fields').find( '#product_attributes');

    // If the product ID is present, call the Ajax function to get the product details
    if (productId) {
      debugger;
      $.ajax({
        url: '/products/' + productId + '/details.json',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
          // Calculate the amount
          var amount = data.rate * $('#product_weight').val();

          // Display the amount in the amount input field
          $('#product_total').val(amount);
        }
      });
    }
  });

  // Calculate the amount when the Calculate Amount button is clicked
  $('#calculate_amount').on('click', function() {
    $('#product_weight').trigger('change');
  });
});
