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
  clink_link(link)
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
