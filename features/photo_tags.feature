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
    And I should see "tag1"


  Scenario: User edits a photo
    Given I have an existing user account
    And I have an existing category
    And I have an existing photo
    When I visit "/sign_in"
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I press "Submit"
    And I click "Categories"
    And I click "category-name"
    And I click "photo"
    And I click "Edit Note"
    And I fill in "tags[name]" with "tag1"
    And I press "Update Photo"
    Then I should see "Photo:"
    And I should not see "Photo could not be created"
    And I should see "tag1"
