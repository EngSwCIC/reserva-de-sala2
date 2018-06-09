# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_06_08_233823) do

  create_table "horarios", force: :cascade do |t|
    t.time "horario"
  end

  create_table "salas", force: :cascade do |t|
    t.date "data"
    t.string "materia"
    t.string "turma"
    t.integer "usuario_id"
    t.integer "sala_id"
    t.integer "horario_id"
    t.index ["horario_id"], name: "index_reservas_on_horario_id"
    t.index ["sala_id"], name: "index_reservas_on_sala_id"
    t.index ["usuario_id"], name: "index_reservas_on_usuario_id"
  end

  create_table "salas", force: :cascade do |t|
    t.string "predio"
    t.string "numero"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha"
  end

end
