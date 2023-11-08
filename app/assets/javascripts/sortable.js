
  $(document).ready(function () {

    $('.sortable').on('click', function () {
      const $icon = $(this).find('i.fa-sort');
      if ($icon.hasClass('fa-sort')) {
        $icon.removeClass('fa-sort').addClass('fa-sort-up');
        // Implement ascending sorting logic here
      } else {
        $icon.removeClass('fa-sort-up').addClass('fa-sort-down');
        // Implement descending sorting logic here
      }
    });
  });
