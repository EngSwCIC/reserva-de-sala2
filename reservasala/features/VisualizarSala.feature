Feature: Usuario consegue visualizar as reservas de uma sala

  Scenario: Visualizar reservas de uma sala - Happy Path
    Given I am on the login page
    When I fill in "nomeLogin" with "Pedro"
    And I fill in "senhaLogin" with "senha2"
    When I press "entrar"
    Then I should be on the home page
    When I follow "visualizar1"
    Then I should be on the sala page