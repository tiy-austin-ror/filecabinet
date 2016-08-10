Given(/^I have an existing test environment/) do
  admin = User.create!(name: "admin", email: "admin@example.com", password: "password", admin: true)
  user = User.create!(name: "user", email: "user@example.com", password: "password", admin: false)

  cat1 = Category.create!(name: "Parent Category1", user: admin)
  cat2 = Category.create!(name: "Parent Category2", user: admin)
  Category.create!(name: "Parent Category3", user: admin)


  cat11 = Category.create!(name: "Child Category1", parent_category_id: cat1.id, user: admin)
  Category.create!(name: "Child Category2", parent_category_id: cat1.id, user: admin)
  Category.create!(name: "Child Category3", parent_category_id: cat2.id, user: user)


  Note.create!(name: "Note 1", body: "Body 1", file_type: ".md", category_id: cat1.id, user: admin)
  Note.create!(name: "Note 2", body: "Body 2", file_type: ".md", category_id: cat1.id, user: admin)

  Photo.create!(name: "Photo 1", desc: "Desc 1", category_id: cat1.id, user: admin, upload: "http://imgs.xkcd.com/comics/tags.png")
  Photo.create!(name: "Photo 2", desc: "Desc 2", category_id: cat1.id, user: admin, upload: "http://imgs.xkcd.com/comics/tags.png")

  Photo.create!(name: "Photo 3", desc: "Desc 3", category_id: cat11.id, user: admin, upload: "http://imgs.xkcd.com/comics/tags.png")
end
