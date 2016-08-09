Given(/^I have an existing user account$/) do
  User.create!(email: "user@example.com", name: "user", password: "password")
end

Given(/^I have an existing category$/) do
  Category.create!(name: Faker::Company.buzzword)
end

When(/^I visit "([^"]*)"$/) do |path|
  visit(path)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

When(/^I click "([^"]*)"$/) do |link|
  click_link(link)
<<<<<<< HEAD
=======
end

When(/^I find "([^"]*)"$/) do |id|
  # print page.html
  find_by_id(id)
>>>>>>> 9c90dc4a642fa9f3cca24eead512759773c3e08d
end

When(/^I press "([^"]*)"$/) do |button|
  click_button(button)
end

When(/^I debug$/) do
  puts page.html
  binding.pry
end

When(/^I upload the test photo$/) do
  attach_file("photo[upload]", Rails.root + "test/fixtures/test_photo.png")
end

Then(/^I should see "([^"]*)"$/) do |content|
  assert page.has_content?(content)
end

Then(/^I should not see "([^"]*)"$/) do |content|
  refute page.has_content?(content)
end
