Feature: Usuario pode fazer uma reserva

  Scenario: Fazer uma reserva válida - Happy Path
    Given I am on the login page
    When I fill in "nomeLogin" with "Pedro"
    And I fill in "senhaLogin" with "senha2"
    When I press "entrar"
    Then I should be on the home page
    When I follow "Nova Reserva"
    Then I should be on the Nova Reserva page
    When I fill in "materia" with "Organizacao e Arquitetura de Computadores"
    And I fill in "turma" with "B"
    And I select "AT-029" from "sala"
    And I fill in "data" with "2018-04-11"
    And I select "8:00" from "horario"
    When I press "cadastrar"
    Then I should be on the home page
    When I follow "Visualizar Reservas"
    Then I should be on the reserva do usuario page
    And I should see "Organizacao e Arquitetura de Computadores B PAT - Pavilhão Anísio Teixeira AT-029 11/04/2018 8:00"

  Scenario: Fazer uma reserva válida - Sad Path
    Given I am on the login page
    When I fill in "nomeLogin" with "Pedro"
    And I fill in "senhaLogin" with "senha2"
    When I press "entrar"
    Then I should be on the home page
    When I follow "Nova Reserva"
    Then I should be on the Nova Reserva page
    When I fill in "materia" with ""
    And I fill in "turma" with "B"
    And I select "AT-029" from "sala"
    And I fill in "data" with "2018-04-11"
    And I select "8:00" from "horario"
    When I press "cadastrar"
    Then I should be on the error reservas page