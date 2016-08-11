Given(/^I have an existing omnitest environment/) do
  admin = Admin.create!(name: "admin", email: "admin@example.com", password: "password", admin: true)
  user = User.create!(name: "user", email: "user@example.com", password: "password", admin: false)
  User.create!(name: "user2", email: "user2@example.com", password: "password", admin: false)

  cat1 = Category.create!(name: "Category1")
  cat2 = Category.create!(name: "Category2")
  Category.create!(name: "Category3")

  Note.create!(name: "Note for admin", body: "Body 1", file_type: ".md", category_id: cat1.id, user: admin)
  Note.create!(name: "Note for admin", body: "Body 1", file_type: ".md", category_id: cat1.id, user: admin)

  Note.create!(name: "Note for user", body: "Body 2", file_type: ".md", category_id: cat1.id, user: user)

  Photo.create!(name: "Photo for admin", desc: "Desc 1", category_id: cat1.id, user: admin, upload: "http://imgs.xkcd.com/comics/tags.png")
  Photo.create!(name: "Photo for admin", desc: "Desc 2", category_id: cat2.id, user: admin, upload: "http://imgs.xkcd.com/comics/tags.png")

  Photo.create!(name: "Photo for admin", desc: "Desc 1", category_id: cat1.id, user: user, upload: "http://imgs.xkcd.com/comics/tags.png")

end
