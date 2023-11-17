$(document).on('cocoon:after-insert', function(e, insertedItem) {
  var select = insertedItem.find('.product_select');
  select.on('change', function() {
    debugger;
    handleProductSelection(select);

  });


function handleProductSelection(select) {
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


function calculateAmount(button) {
  var productRate = parseFloat($('#product_rate').text());
  var weight = parseFloat(document.getElementById('weight').value);
  var amount =  productRate * weight;
   console.log(productRate);
   console.log(weight);
   var resultElement = document.getElementById('result');
   resultElement.textContent = `${amount}`;
   console.log(amount);

   // Update the amount attribute of the item const itemId = button.dataset.itemId;
   var itemElement = document.getElementById(`result-${itemId}`);
   var itemAmountInput = itemElement.querySelector('input[name="item[amount]"]');
   itemAmountInput.value = amount;


  }


const spanElement = document.getElementById('result');
const inputField = document.querySelector('input[name="item[amount]"]');

inputField.id = spanElement.id;
