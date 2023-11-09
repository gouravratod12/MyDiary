$(document).on('cocoon:after-insert', function(e, insertedItem) {

    handleProductSelection(select);

  });


function handleProductSelection(select) {
  debugger;
  var productId = select.val();
  var fieldsContainer = select.closest('.nested-fields').find('.product-field');

  if (productId) {
    // Make an AJAX request to fetch product details
    $.ajax({
      url: '/products/' + productId + '/details.json',
      type: 'GET',
      dataType: 'json',
      success: function(data) {
        fieldsContainer.show();
        select.closest('.nested-fields').find('.unit').text(data.unit);
        select.closest('.nested-fields').find('.product_rate').text(data.product_rate);
      }
    });
  } else {
    fieldsContainer.hide();
  }
}
});
