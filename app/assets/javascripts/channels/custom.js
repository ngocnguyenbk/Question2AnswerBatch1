$(document).on('turbolinks:load', function() {
  $('form').on('click','.remove-fields', function(e) {
    e.preventDefault();
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('tr').hide();
  })
  $('form').on('click','.add-fields', function(e) {
    e.preventDefault();
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.fields').append($(this).data('fields').replace(regexp, time));
  })
})
