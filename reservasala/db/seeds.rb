# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Seed the RottenPotatoes DB with some movies.
mais_usuarios = [
    {:nome => 'André', :email => 'andre@email.com'},
    {:nome => 'Pedro', :email => 'pedro@email.com'},
    {:nome => 'Bruno', :email => 'bruno@email.com'}
]

mais_usuarios.each do |usuario|
  Usuario.create!(usuario)
end