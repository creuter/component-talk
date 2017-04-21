$(function() {
  $('[data-bubble-help]').on('click', function() {
    var target = '#' + $(this).attr('data-bubble-help');
    var isExpanded = $(target).attr('aria-hidden') === 'false';
    $(target).attr('aria-hidden', isExpanded);
    $(this).attr('aria-expanded', !isExpanded);
  });
});
