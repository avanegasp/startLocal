# == Schema Information
#
# Table name: levels
#
#  id              :integer          not null, primary key
#  name            :string
#  required_points :integer
#  image_url       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :level do
    name "Teclado Blanco"
    required_points 0
    image_url "https://s3.amazonaws.com/makeitreal/levels/nivelBlanco%402x.png"

    # Level.create(name: "Teclado Amarillo", required_points: 1000, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelAmarillo%402x.png")
    # Level.create(name: "Teclado Naranja", required_points: 2500, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelNaranja%402x.png")
    # Level.create(name: "Teclado Verde", required_points: 4500, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelVerde%402x.png")
    # Level.create(name: "Teclado Azul", required_points: 7500, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelAzul%402x.png")
    # Level.create(name: "Teclado Purpura", required_points: 10500, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelPurpura%402x.png")
    # Level.create(name: "Teclado Café", required_points: 13500, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelCafe%402x.png")
    # Level.create(name: "Teclado Rojo", required_points: 16500, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelRojo%402x.png")
    # Level.create(name: "Teclado Negro", required_points: 20000, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelNegro%402x.png")

  end
end
