Given(/^I have an existing user account$/) do
  User.create!(email: "user@example.com", name: "user", password: "password")
end

When(/^I visit "([^"]*)"$/) do |path|
  visit(path)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

When(/^I click "([^"]*)"$/) do |link|
  click_link(link)
end

When(/^I find "([^"]*)"$/) do |id|
  # print page.html
  find_by_id(id)
end

When(/^I press "([^"]*)"$/) do |button|
  click_button(button)
end

Then(/^I should see "([^"]*)"$/) do |content|
  assert page.has_content?(content)
end
