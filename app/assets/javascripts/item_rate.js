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
   var itemElement = document.getElementById(`item-${itemId}`);
   var itemAmountInput = itemElement.querySelector('input[name="item[amount]"]');
   itemAmountInput.value = amount;


  }


  const spanElement = document.getElementById('result');
const inputField = document.querySelector('input[name="item[amount]"]');

inputField.id = spanElement.id;
