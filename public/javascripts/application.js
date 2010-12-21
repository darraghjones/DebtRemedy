// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults#


$(document).ready(function() {
  if ($('#client_housing_status').val() != 'rent') $('#client_rent_type').attr('disabled', 'disabled')
  $('#client_housing_status').change(function() {
    if($(this).val() == 'rent') 
      $('#client_rent_type').attr('disabled', '') 
    else
      $('#client_rent_type').attr('disabled', 'disabled')
  });
  
  $('.delete_debt_check_box').remove();
  $('.delete_debt_label').remove();
  $('.delete_debt_link').show();
  $('.delete_debt_link').click(function() {
    debt = $(this).parent().parent();
    $('input[type=hidden]', debt).val(1);
    debt.hide();
  });  
  
});
