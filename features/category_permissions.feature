Feature: User with certain permissions (categories and their subcategories) can see the appropriate permitted content

Background: A User Logs In
  Given I have an existing user account
  And another user account exists
  And there is an existing category
  And there is an existing note
  And there is an existing photo
  When I visit "/sign_in"
  And I fill in "Email" with "user@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
