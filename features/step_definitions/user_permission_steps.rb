Given(/^I have permission to see a note$/) do
  Permission.create!(user: User.last, permission_type: "Note", permission_id: 1, full_access: false)
end

When(/^there is an existing note$/) do
  Note.create!(id: 1, name: "Test_name", body: "Test body", file_type: "txt", category: Category.last, user: User.first)
end

When(/^there is an existing category$/) do
  Category.create!(name: "Category")
end

Given(/^another user account exists$/) do
  User.create!(email: "user2@example.com", name: "user2", password: "password")
end
