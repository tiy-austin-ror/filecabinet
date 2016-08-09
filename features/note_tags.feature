Feature: User tags notes

  Scenario: User creates a note
    Given I have an existing user account
    When I visit "/sign_in"
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I press "Submit"
    And I visit "/notes/new"
    And I fill in "note[name]" with "note-name"
    And I fill in "note[body]" with "note body"
    And I fill in "tags[name]" with "tag1, tag2"
    And I press "Create Note"
    Then I should see "Note:"
    And I should see "Body: note body"
