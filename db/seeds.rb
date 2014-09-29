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
                          price: 1,
                          duration: 1,
                          user: arun)
multipla_pic_1 = multipla.pictures.create(url: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTe-qI_E5pt4u6H3JE0LVmXBfQ0O_GcfhQ91cDqLrTUvBBCEl1Q3g')

veyron_supersport = Auction.create(title: 'Bugatti Veyron Supersport',
                                   description: 'Nah, I got two of them. Who wants one?',
                                   price: 100000,
                                   duration: 10,
                                   user: oliver)
veyron_supersport_pic_1 = veyron_supersport.pictures.create(url: 'http://2.bp.blogspot.com/-6bsdhPttBKY/UTf4BfkVQrI/AAAAAAAABRI/Y6uQBSPpmOY/s1600/2011-bugatti-veyron-super-sport-interior-pasuper-sport.jpg')

venom_gt = Auction.create(title: 'Hennessey Venom GT',
                          description: 'Great car, only used once!',
                          price: 99999,
                          duration: 5,
                          user: oliver)
venom_gt_pic_1 = venom_gt.pictures.create(url: 'http://www.romansinternational.com/profiles/2319_Romans_International/cache/51192212c2fa9_crop_693_525.jpg')
mercedes = Auction.create(title: 'Mercedes-Benz SLS AMG',
                          description: 'I just love this car, but I need the money so bad!',
                          price: 1000,
                          duration: 100,
                          user: arun)
mercedes_pic_1 = mercedes.pictures.create(url: 'http://automobilesdeluxe.tv/wp-content/uploads/2009/09/mercedes-sls-amg-interior-automobilesdeluxe-640x424.jpg')
bmw = Auction.create(title: 'BMW M6 Gran Coupe',
                     description: 'Nah, I got two of them. Who wants one?',
                     price: 3000,
                     duration: 10,
                     user: urs)

tesla = Auction.create(title: 'Tesla Model S',
                       description: 'Great car, only used once!',
                       price: 999,
                       duration: 60,
                       user: arun)

lambo = Auction.create(title: 'Lamborghini Aventador',
                       description: 'Nah, I got two of them. Who wants one?',
                       price: 100000,
                       duration: 10,
                       user: urs)

ford = Auction.create(title: 'Ford Shelby GT500',
                      description: 'Great car, only used once!',
                      price: 100,
                      duration: 500,
                      user: urs)

audi = Auction.create(title: 'Audi RS 7',
                      description: 'I just love this car, but I need the money so bad!',
                      price: 100,
                      duration: 10000,
                      user: urs)

corvette = Auction.create(title: 'Corvette Stingray',
                          description: 'Nah, I got two of them. Who wants one?',
                          price: 10000,
                          duration: 100,
                          user: urs)

rolls = Auction.create(title: 'Rolls Royce Phantom',
                       description: 'Great car, only used once!',
                       price: 99999,
                       duration: 30,
                       user: oliver)

ferrari = Auction.create(title: 'Ferrari 458',
                         description: 'I just love this car, but I need the money so bad!',
                         price: 99,
                         duration: 600,
                         user: arun)

nissan = Auction.create(title: ' Nissan GT-R',
                        description: 'Nah, I got two of them. Who wants one?',
                        price: 100000,
                        duration: 10,
                        user: urs)

aston = Auction.create(title: 'Aston Martin V8 Vantage',
                       description: 'Great car, only used once!',
                       price: 99999,
                       duration: 5,
                       user: oliver)