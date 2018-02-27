# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Rails.env.production?
  require 'factory_bot_rails'

  loops = 5

  # Create users
  p "Creating #{ 'User'.pluralize(loops) }"

  loops.times do
    user = FactoryBot.build(:user)
    if user.save
      p "User: #{ user.username } created with password: #{ user.password }"
    end
  end

end
