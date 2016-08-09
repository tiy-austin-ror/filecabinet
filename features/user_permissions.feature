Feature: As a User,
I want to give other users permission to view my notes and photos,
So that the right users have access to the right content

Scenario: User sees a note they have permission to see
  Given I have an existing user account
  And another user account exists
  And there is an existing category
  And there is an existing note
  When I visit "/sign_in"
  And I fill in "Email" with "user@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
  When I visit "/notes/1"
  And I have permission to see a note
  Then I should see "Note: "
  And I should see "Name: Test_note.txt"
  And I should see "Author:"
  And I should see "Category:"
  And I should see "Body: Test body"
  And I should see "Edit Note"
  And I should see "Delete Note"

Scenario: User sees a photo they have permission to see
  Given I have an existing user account
  And another user account exists
  And there is an existing category
  And there is an existing photo
  When I visit "/sign_in"
  And I fill in "Email" with "user@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
  When I visit "/photos/1"
  And I have permission to see a photo
  Then I should see "Photo: "
  And I should see "Name: Test_photo"
  And I should see "Author:"
  And I should see "Category:"
  And I should see "Description:"
  And I should see "Edit Photo"
  And I should see "Delete Photo"
