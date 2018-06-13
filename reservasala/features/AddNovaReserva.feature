Feature: User can manually add reserva

  Scenario: Add a reserva
    Given I am on the home page
    When I follow "Nova Reserva"
    Then I should be on the Nova Reserva page

    When I fill in "materia" with "Oi"
    And I fill in "turma" with "B"
    And I select "AT-029" from "sala"
    And I fill in "data" with "2018-04-11"
    And I select "8:00" from "horario"
    When I press "cadastrar"
    Then I should be on the home page