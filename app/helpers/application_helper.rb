require 'redcarpet/render_strip'

module ApplicationHelper
  def markdown_to_plain(text)
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    renderer.render(text).html_safe
  end

  def markdown_to_html(text)
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    renderer.render(text).html_safe
  end
end
