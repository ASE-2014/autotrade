# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

urs = User.create(email: 'u@z.ch',
                  username: 'Urs',
                  password: '12345678',
                  password_confirmation: '12345678')

oliver = User.create(email: 'o@s.ch',
                     username: 'Oliver',
                     password: '12345678',
                     password_confirmation: '12345678')

arun = User.create(email: 'a@s.ch',
                   username: 'Arun',
                   password: '12345678',
                   password_confirmation: '12345678')

multipla = Auction.create(title: 'Fiat Multipla',
                          description: 'I just love this car, but I need the money so bad!',
                          price: 1000,
                          duration: 1,
                          user: arun)

veyron_supersport = Auction.create(title: 'Bugatti Veyron Supersport',
                                   description: 'Nah, I got two of them. Who wants one?',
                                   price: 100000,
                                   duration: 10,
                                   user: urs)

venom_gt = Auction.create(title: 'Hennessey Venom GT',
                          description: 'Great car, only used once!',
                          price: 99999,
                          duration: 5,
                          user: oliver)