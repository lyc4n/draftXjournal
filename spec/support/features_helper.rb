module FeaturesHelper
  def fill_in_editor_field(text)
    within ".CodeMirror" do
      current_scope.click
      field = current_scope.find('textarea', visible: false)
      field.send_keys text
    end
  end

  def have_editor_display(options)
    editor_display_locator = '.CodeMirror-code'
    have_css(editor_display_locator, options)
  end
end
