# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create Admin User

user = User.new(email: 'admin@example.net', admin: true, password: 'admin')
user.save


#Create Religion

Religion.create(religion: 'Muslim')
Religion.create(religion: 'Christian')
Religion.create(religion: 'Jewish')
Religion.create(religion: 'Other')

# Create Gender
Gender.create(gender: 'Male')
Gender.create(gender: 'Female')
Gender.create(gender: 'Transgender male')
Gender.create(gender: 'Transgender female')
Gender.create(gender: 'Unknown')