require 'rails_helper'

RSpec.describe Journal::Entry do
  it {is_expected.to define_enum_for(:entry_type).with([:task, :event, :note])}
  it {is_expected.to define_enum_for(:status).with([:untouched, :done])}

  describe 'Associations' do
    it {is_expected.to belong_to :journal}
  end

  describe 'Validations' do
    it {is_expected.to validate_presence_of(:title)}
    it {is_expected.to validate_presence_of(:target_date)}
    it {is_expected.to validate_presence_of(:entry_type)}
    it {is_expected.to validate_presence_of(:status)}
  end
end
