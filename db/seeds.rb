# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all if Rails.env.development?
Haircut.destroy_all if Rails.env.development?
Booking.destroy_all if Rails.env.development?

haircuts = %w[Undercut Militar Moicano]
styles = %w[Baixo Médio Alto]

User.create(
  email: 'victor@barbier.com',
  password: '123123',
  first_name: 'Victor',
  last_name: 'Moreira',
  address: 'Rua Jericó, 193, São Paulo'
)

User.create(
  email: 'giovanni@barbier.com',
  password: '123123',
  first_name: 'Giovanni',
  last_name: 'Guadagnucci',
  address: 'Rua Mourato Coelho, 208, São Paulo'
)

User.create(
  email: 'jose@barbier.com',
  password: '123123',
  first_name: 'José',
  last_name: 'Carlos',
  address: 'R. Paris, 227, São Paulo'
)

haircuts.each do |haircut|
  Haircut.create(
    user: User.first,
    style: haircut,
    price: rand(10..50),
    category: styles.sample
  )
end

10.times do
  Booking.create(
    user: User.all.sample,
    haircut: Haircut.all.sample,
    appointment: Time.now,
    rating: rand(3..5),
    price: rand(10..50)
  )
end
