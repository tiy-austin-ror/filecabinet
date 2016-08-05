User.create!(name: "admin", email: "admin@example.com", password: "password", admin: true)

10.times do
  Tag.create(name: Faker::Commerce.color)
end


10.times do
  Category.create!(name: Faker::Company.buzzword)
end
NOTE_NAMES = ["Board_Meeting_2016-08-04", "Scrum_2016-08-04", "Sprint_Review_2016-08-04", "Employee_Evaluations_2016-08-04"]
NOTE_BODIES = ["We need to shut down the company - immediately", "Everyone is blocked by the pile-up of back-end stories", "nothing worked well - back to the drawing board for the next sprint", "Our employees suck - let's clean the house and start fresh"]
NOTE_TYPES = ["txt", "md"]

PHOTO_NAMES = ["White_Board_2016-08-04", "Meeting_Notes_2016-08-04", "Sprint_Review_Board_2016-08-04", "Scrum_Notes_2016-08-04"]
PHOTO_BODIES = ["White board photo from the meeting", "Photo-notes from the board meeting", "Photo of white board from sprint review", "Photo-notes from daily scrum"]
PHOTO_TYPES = ["jpg", "gif", "png"]


NOTE_NAMES.each_with_index do |name, i|
  Note.create!(name: name, body: NOTE_BODIES[i], file_type: NOTE_TYPES.sample, category_id: 1, user_id: 1)
  Photo.create!(name: PHOTO_NAMES[i], category_id: 1, user_id: 1)
end
