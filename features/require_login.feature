Feature: If not signed in, all pages redirect to sign in
  Scenario: Dashboard
    When I visit "/"
    Then I should see "Forgot Password?"

  Scenario: User index
    When I visit "/users"
    Then I should see "Forgot Password?"

  Scenario: Category index
    When I visit "/categories"
    Then I should see "Forgot Password?"
  Scenario: Category show
    When I visit "/categories/1"
    Then I should see "Forgot Password?"
  Scenario: Category edit
    When I visit "/categories/1/edit"
    Then I should see "Forgot Password?"
  Scenario: Category new
    When I visit "/categories/new"
    Then I should see "Forgot Password?"

  Scenario: Note index
    When I visit "/notes"
    Then I should see "Forgot Password?"
  Scenario: Note show
    When I visit "/notes/1"
    Then I should see "Forgot Password?"
  Scenario: Note edit
    When I visit "/notes/1/edit"
    Then I should see "Forgot Password?"
  Scenario: Note new
    When I visit "/notes/new"
    Then I should see "Forgot Password?"

  Scenario: Photo index
    When I visit "/photos"
    Then I should see "Forgot Password?"
  Scenario: Photo show
    When I visit "/photos/1"
    Then I should see "Forgot Password?"
  Scenario: Photo edit
    When I visit "/photos/1/edit"
    Then I should see "Forgot Password?"
  Scenario: Photo new
    When I visit "/photos/new"
    Then I should see "Forgot Password?"

  Scenario: Tags index
    When I visit "/tags"
    Then I should see "Forgot Password?"
  Scenario: Tags show
    When I visit "/tags/1"
    Then I should see "Forgot Password?"
  Scenario: Tags edit
    When I visit "/tags/1/edit"
    Then I should see "Forgot Password?"
  Scenario: Tags new
    When I visit "/tags/new"
    Then I should see "Forgot Password?"
