// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's 
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require turbolinks
//= require simplemde.min
//= require_tree .
//


document.addEventListener('turbolinks:load', function() {
  editorValueContainer = document.getElementById('markdown-editor');
  if(editorValueContainer){
    simplemde = new SimpleMDE({
      element: document.getElementById('markdown-editor'),
      spellChecker: false,
      codeSyntaxHighlighting: false,
      forceSync: true,
      toolbar: [
        'bold', 'italic', 'strikethrough',
        '|',
        'heading', 'heading-smaller', 'heading-bigger', 'heading-1', 'heading-2', 'heading-3',
        '|',
        'code', 'quote', 'unordered-list', 'ordered-list', 'clean-block',
        '|',
        'link', 'image', 'table', 'horizontal-rule', 'preview', 'guide'
      ]
    });
  }
})
