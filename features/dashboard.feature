Feature: As a User, I would like to be able to see notes and photos on the Dashboard.

Background: A User logs in
  Given I have an existing dashboard environment
    When I visit "/sign_in"
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I press "Submit"
<<<<<<< HEAD
=======
    And I should see "Create Note"

>>>>>>> 9ed94acc997e77d32c48fe4bec351ad62ba9805e

Scenario: User sees photos, notes, creates on dashboard
  Then I should see "photo"
  And I should see "note"
  And I should see "Create a Photo"
