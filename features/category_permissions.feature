Feature: User with certain permissions (categories and their subcategories) can see the appropriate permitted content

Background: A User Logs In
  Given I have an existing non-admin user account
  And I have an existing user account
  And I have an existing category
  And I have a different existing note
  And I have a different existing photo
  When I visit "/sign_in"
  And I fill in "Email" with "user2@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"

Scenario: User sees the proper notification in a category they have no permission to see
  When I visit "/categories"
  And I click "category-name (2 items)"
  Then I should see "You do not have permission to see anything in this category."
