Feature: Usuario consegue visualizar suas reservas

  Scenario: Visualizar reservas do usuario - Happy Path
    Given I am on the login page
    When I fill in "nomeLogin" with "Pedro"
    And I fill in "senhaLogin" with "senha2"
    When I press "entrar"
    Then I should be on the home page
    When I follow "Visualizar Reservas"
    Then I should be on the reserva do usuario page