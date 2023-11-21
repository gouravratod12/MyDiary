
$(document).ready(function() {
  $('.sort-button').on('click', function() {
    var attribute = $(this).data('attribute');
    var order = $(this).find('.sort-indicator').text();

    if (order === '') {
      order = 'asc';
    } else if (order === 'asc') {
      order = 'desc';
    } else {
      order = 'asc';
    }

    $(this).find('.sort-indicator').text(order);

    $.ajax({
      url: window.location.pathname,
      data: {
        sort_by: attribute,
        sort_order: order
      },
      dataType: 'json',
      success: function(data) {
        $('.customers-table tbody').html(data.customers);
      }
    });
  });
});
