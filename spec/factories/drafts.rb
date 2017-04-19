sample_content = "# Lorem ipsum dolor sit amet\nconsectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud **exercitation ullamco laboris** nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

titles = ['The big one', 'Into the red', 'Ora et Labora', 'Ubiqutous Panda']

FactoryGirl.define do
  factory :draft do
    content sample_content
    title   titles.sample
    user
  end
end
