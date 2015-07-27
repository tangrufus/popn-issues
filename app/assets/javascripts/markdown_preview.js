$(function () {
  if (! $('.markdown-source'))
    return;
  if (! $('#markdown-preview'))
    return;

  var md = window.markdownit({
    html: true,
    breaks: true,
    linkify: true,
  }).use(window.markdownitEmoji);

  $('.markdown-source').bind('input propertychange', function() {
    $result = md.renderInline($('.markdown-source').val());
    $html = '<hr><strong>Preview:</strong> <a class="text-muted" href="http://www.emoji-cheat-sheet.com/" target="_blank"><small>(Emoji might be wrong in the preview, but correct after submit)</small></a><br/>'+ $result + '<hr>';
    $('#markdown-preview').html($html);
  });
});