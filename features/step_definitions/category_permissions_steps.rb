Given(/^I have an existing non-admin user account$/) do
  User.create!(email: "user2@example.com", name: "user2", password: "password", admin: false)
end

Given(/^I have a different existing photo$/) do
  Photo.create!(name: "photo", desc: "description", category: Category.first, user: User.second, upload: "http://imgs.xkcd.com/comics/tags.png")
end

Given(/^I have a different existing note$/) do
  Note.create!(name: "note", body: "body", file_type: "txt", category: Category.first, user: User.second)
end
