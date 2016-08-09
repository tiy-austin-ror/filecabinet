Feature: User tags notes

  Scenario: User creates a note
    Given I have an existing user account
    And I have an existing category
    When I visit "/sign_in"
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I press "Submit"
    And I visit "/notes/new"
    And I fill in "note[name]" with "note-name"
    And I fill in "note[body]" with "note body"
<<<<<<< HEAD
    And I fill in "tags[name]" with "tag1"
=======
    And I fill in "tags[name]" with "tag1, tag2"
>>>>>>> 9c90dc4a642fa9f3cca24eead512759773c3e08d
    And I press "Create Note"
    Then I should see "Note:"
    And I should not see "Note could not be created"
    And I should see "tag1"
<<<<<<< HEAD

  Scenario: User edits a note
    Given I have an existing user account
    And I have an existing category
    And I have an existing note
    When I visit "/sign_in"
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I press "Submit"
    And I click "Categories"
    And I click "category-name"
    And I click "note"
    And I click "Edit"
    And I fill in "tags[name]" with "tag1"
    And I press "Update Note"
    Then I should see "Note:"
    And I should not see "Note could not be created"
    And I should see "tag1"
=======
>>>>>>> 9c90dc4a642fa9f3cca24eead512759773c3e08d
