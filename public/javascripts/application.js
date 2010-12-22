// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults#


$(document).ready(function() {
  
  $('#client_housing_status').change(function() {
    if($(this).val() == 'rent') 
      $('#client_rent_type').attr('disabled', '') 
    else
      $('#client_rent_type').attr('disabled', 'disabled')
  }).change()
  
  $('.delete_debt_check_box').remove();
  $('.delete_debt_label').remove();
  $('.delete_debt_link').click(function() {
    if (!confirm('Are you sure you want to delete this debt?')) return;
    debt = $(this).parent().parent();
    $('input', debt).val('');
    $('select', debt).val('');
    $('input[type=hidden]', debt).val(1);
    //debt.hide();
    return false;
  }).show();
  
  
  $('.debt_balance').change(function() {
    balance = $(this).val();
    $(this).parent().parent().find('.contractual_payment').val(balance / 2);
  }).change();
  
});
