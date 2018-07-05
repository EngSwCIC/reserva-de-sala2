Feature: Usuario pode cadastrar um usuario

  Scenario: Cadastrar um novo usuario - Happy Path
    Given I am on the login page
    When I follow "cadastrarNovo"
    Then I should be on the login page
    When I fill in "nome" with "Usuario1"
    And I fill in "senha" with "senha"
    And I fill in "email" with "usuario1@email.com"
    When I press "cadastrar"
    Then I should be on the login page
    When I fill in "nomeLogin" with "Usuario1"
    And I fill in "senhaLogin" with "senha"
    When I press "entrar"
    Then I should be on the home page