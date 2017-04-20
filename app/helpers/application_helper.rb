require 'redcarpet/render_strip'

module ApplicationHelper
  def markdown_to_plain
    Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
  end
end
