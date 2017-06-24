class Draft < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  scope :latest_first, ->{order(created_at: :desc)}

  def content_preview
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    renderer.render(content).html_safe.truncate(50)
  end
end
