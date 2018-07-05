# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/salas'

    when /^the Nova Reserva\s?page$/
      '/reservas/new'

    when /^the login\s?page$/
      '/usuarios'

    when /^the sala\s?page$/
      '/reservas/sala/1'

    when /^the error reservas\s?page$/
      '/reservas'

    when /^the reserva do usuario\s?page$/
      '/reservas_user'
    end
  end
end

World(NavigationHelpers)
