Feature: Usuario consegue excluir uma reserva

  Scenario: Excluir reserva do usuario - Happy Path
    Given I am on the login page
    When I fill in "nomeLogin" with "Pedro"
    And I fill in "senhaLogin" with "senha2"
    When I press "entrar"
    Then I should be on the home page
    When I follow "Visualizar Reservas"
    Then I should be on the reserva do usuario page
    And I should see "Engenharia de Software C PJC - Pavilhão João Calmon BT-085 14/06/2018 14:00"
    When I press "delete2"
    Then I should not see "Engenharia de Software C PJC - Pavilhão João Calmon BT-085 14/06/2018 14:00"