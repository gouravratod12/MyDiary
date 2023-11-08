$(document).ready(function() {

  $('#dynamic_select').on('change', function() {
  var selectedOption = $(this).val();
  var rateField = $('#item_rate');



  // Implement dynamic behavior based on the selected option
  if (selectedOption === 'Milk') {
  rateField.val('50');


  } else if (selectedOption === 'Paneer') {
  rateField.val('250');

  } else if (selectedOption === 'Mawa') {
  rateField.val('250');

  }

  else if (selectedOption === 'Butter') {
    rateField.val('700');
    }

  else if (selectedOption === 'Butter Milk') {
      rateField.val('25');
   }

   else if (selectedOption === 'Curd') {
    rateField.val('50');
    }


  else {
  rateField.val(''); // Clear the rate field if no option is selected
  }
  });
  });
