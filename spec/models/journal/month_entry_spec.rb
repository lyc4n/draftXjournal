require 'rails_helper'

RSpec.describe Journal::MonthEntry do

  it {is_expected.to define_enum_for(:type).with([:task, :event, :note])}

  describe 'Associations' do
    it {is_expected.to belong_to :month}
  end

  describe 'Validations' do
    subject{build(:journal_month_entry, type: 'task')}
    it {is_expected.to validate_presence_of(:title)}
    it {is_expected.to validate_presence_of(:month)}
    it {is_expected.to validate_presence_of(:type)}
  end
end
