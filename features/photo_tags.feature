Feature: User tags photos

  Scenario: User creates a photo
    Given I have an existing user account
    And I have an existing category
    When I visit "/sign_in"
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I press "Submit"
    And I visit "/photos/new"
    And I fill in "photo[name]" with "photo-name"
    And I fill in "photo[desc]" with "picture description"
    And I upload the test photo
    And I fill in "tags[name]" with "tag1"
    And I press "Create Photo"
    Then I should see "Photo:"
    And I debug
    And I should see "tag1"
