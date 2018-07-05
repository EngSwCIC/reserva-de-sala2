Feature: Usuario consegue se autenticar no sistema

  Scenario: Fazer login - Happy Path
    Given I am on the login page
    When I fill in "nomeLogin" with "Pedro"
    And I fill in "senhaLogin" with "senha2"
    When I press "entrar"
    Then I should be on the home page

  Scenario: Fazer login - Sad Path
    Given I am on the login page
    When I fill in "nomeLogin" with "Pedro"
    And I fill in "senhaLogin" with "senha3"
    When I press "entrar"
    Then I should be on the login page