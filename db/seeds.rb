# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(
  user_name: 'claudineyveloso',
  email: 'claudineyveloso@gmail.com',
  user_type: 'administrador',
  password: '12345678'
)

130.times do
  User.create(
    user_name: "#{Faker::Name.first_name}""#{Faker::Name.last_name}",
    email: Faker::Internet.email,
    user_type: %w[administrador proprietario atendimento].sample,
    password: '12345678'
  )
end

# 200.times do
#   Customer.create!(
#     people_type: %w[fisica juridica].sample,
#     phone: Faker::PhoneNumber.cell_phone,
#     cell_phone: Faker::PhoneNumber.cell_phone,
#     email: Faker::Internet.email,
#     people_attributes: [{
#       first_name: Faker::Name.first_name,
#       last_name: Faker::Name.last_name,
#       cpf_cnpj: '45623456789',
#       identity_municipal_registration: 'MG-4.345-009',
#       dispatcher: 'SSPMG',
#       birthday_date: Faker::Date.birthday(min_age: 18, max_age: 65)
#     }],
#     addresses_attributes: [{
#       street: Faker::Address.street_name,
#       neighborhood: Faker::Address.community,
#       city: Faker::Address.city,
#       state: %w[SP MG RJ GO RS].sample,
#       zip_code: '30000-000'
#     }]
#   )
# end

# User.create(user_name: 'claudineyveloso', email: 'claudineyveloso@gmail.com', user_type: 'administrador', password: '12345678')
