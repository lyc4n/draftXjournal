require 'rails_helper'
require 'redcarpet/render_strip'

RSpec.describe Draft, type: :model do
  describe 'Associations' do
    it {is_expected.to belong_to :user}
  end

  describe 'Validations' do
    it {is_expected.to validate_presence_of(:title)}
    it {is_expected.to validate_presence_of(:content)}
  end

  describe '#content_preview' do
    it 'returns plain text without markup' do
      draft = Draft.new(content: '# Ruby on Rails')
      expect(draft.content_preview).to eq "Ruby on Rails\n"
    end

    it 'returns the text truncated to 50 characters' do
      draft = Draft.new(content: "# #{'a' * 70}")
      expect(draft.content_preview).to eq "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa..."
    end
  end
end
