Feature: create an account
 
  as a new user
  So that I can properly use the site
  I want to create an account 
 
Background: on home page
 
  Given I am on the home page
 
Scenario: there is a create account form
  Then I should not see "Complete Registration"
  When I follow "Create an Account"
  Then I should see "Fill in the blanks to complete your registration"

Scenario: tries to submit incomplete form
  When I follow "Create an Account"
  And I press "Complete Registration"
  Then I should see "Fill in the blanks to complete your registration"

Scenario: correctly submits create account form
  
