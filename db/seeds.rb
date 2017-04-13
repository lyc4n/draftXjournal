puts 'Starting seed...'

DRAFT_CONTENT_SAMPLE = 'Lorem *ipsum dolor sit amet, consectetur* adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu **fugiat nulla** pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

DRAFT_TITLES = ['The new world', 'Deep blue', 'Dresrossa adventure', 'Crazy Marines', 'Saving the Minks']

[
  {first_name: 'Monkey',    last_name: 'D Luffy'},
  {first_name: 'Roronoa',   last_name: 'Zoro'},
  {first_name: 'Nico',      last_name: 'Robin'},
  {first_name: 'Tony Tony', last_name: 'Chopper'}
].each_with_index do |attr, index|
  User.find_or_create_by(attr) do |user|
    user.password              = 'password'
    user.password_confirmation = 'password'
    user.email = "user#{index + 1}@example.com"
    user.drafts.build(title: DRAFT_TITLES.sample, content: DRAFT_CONTENT_SAMPLE)
  end
end

puts '** Done seeding! **'
puts "**  User total: #{User.count}"
puts "**  Drafts total: #{Draft.count}"
