Feature: As an Admin,
In order to better distribute permissions to groups of employees,
I need to be able to create teams

Background: An Admin Logs In
  Given I have an existing admin account
  And another user account exists
  And there is an existing category
  And there is an existing note
  And there is an existing photo
  And there is an existing team
  When I visit "/sign_in"
  And I fill in "Email" with "admin@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"

Scenario: Admin sees team index
  When I visit "/teams"
  Then I should see "Teams"
  And I should see "members"
  And I should see "Team1"

Scenario: Admin sees team show page
  When I visit "/teams"
  And I click "Team1"
  Then I should see "Team1"
  And I should see "Add Member:"
  And I should see "Team Members:"
