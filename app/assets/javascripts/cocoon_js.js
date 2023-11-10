$(document).on('cocoon:after-insert', function(e, insertedItem) {
  var select = insertedItem.find('#product_select');

  select.on('change', function() {
    handleProductSelection(select);

  });
});

function handleProductSelection(select) {
  var productId = select.val();
  var fieldsContainer = select.closest('.nested-fields').find('.product_attributes');

  if (productId) {
    // Make an AJAX request to fetch product details
    $.ajax({
      url: '/products/' + productId + '/details.json',
      type: 'GET',
      dataType: 'json',
      success: function(data) {
        fieldsContainer.show();
        select.closest('.nested-fields').find('.product_name').text(data.name);
        select.closest('.nested-fields').find('.product_rate').text(data.rate);
        select.closest('.nested-fields').find('.product_unit').text(data.unit);


      }
    });
  } else {
    fieldsContainer.hide();
  }
}