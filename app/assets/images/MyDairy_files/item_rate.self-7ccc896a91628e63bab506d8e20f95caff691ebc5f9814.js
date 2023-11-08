

$(document).ready(function() {
  $('#product_select').change(function() {
    $.ajax({
      url: "/bills/get_product_rate",
      data: { product_id: $(this).val() },
      dataType: 'json',
      success: function(data) {
        $('#rate').val(data.rate);
        $('#unit').val(data.unit);
      }
    });
  });
});
