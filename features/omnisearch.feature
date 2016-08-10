Feature: Use Omnisearch to sort Notes and Photos by (1) User, (2) Category, (3) Name, and (4) Tag

Backgound: An Admin Logs In
  Given I have an existing omnitest environment
    When I visit "/sign_in"
    And I fill in "Email" with "admin@example.com"
    And I fill in "Password" with "password"
    And I press "Submit"

Scenario: An admin clicks "user" and searches "admin"
  When I visit "/"
  When I check "#checkuser"
  And I fill in "search" with "admin"
  And I check "#submit"
  Then I should see "admin"
