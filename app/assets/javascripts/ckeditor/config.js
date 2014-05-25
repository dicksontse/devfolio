CKEDITOR.editorConfig = function( config )
{
  config.toolbar = 'Mini';

  config.toolbar_Mini =
    [
        ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat'],
        ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
        ['Link', 'Unlink'], ['Source'],
        ['Format', 'Font', 'FontSize'], ['TextColor', 'BGColor']
    ];
}