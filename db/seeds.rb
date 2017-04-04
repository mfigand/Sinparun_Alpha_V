# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


decathlon = Company.create([
  {name: 'Decathlon', email: 'decathlon@gmail.com', password: '12345678'}
])


usera, leganes, getafe = Branch.create([
  {name: 'Decathlon Usera', address: 'Avenida Rafaela Ybarra, s/n M40 Salida 24, Autobús: 60 131, 28041 Madrid', latitude:'40.4152606', longitude:'-3.6866882', city: 'Madrid', phone: '555666777', company_id: 1},
  {name: 'Decathlon Leganes', address: 'Avenida Rafaela Ybarra, s/n M40 Salida 24, Autobús: 60 131, 28041 Madrid', latitude:'40.4152606', longitude:'-3.6866882', city: 'Madrid', phone: '555666777', company_id: 1},
  {name: 'Decathlon Getafe', address: 'Avenida Rafaela Ybarra, s/n M40 Salida 24, Autobús: 60 131, 28041 Madrid', latitude:'40.4152606', longitude:'-3.6866882', city: 'Madrid', phone: '555666777', company_id: 1}
])


camiseta, short, gorra, pulsometro = Reward.create([
  {name: 'Camiseta', kms_cost: 50, available_units: 10, description: 'Camiseta Running', valid_from: "2017-04-01 00:00:00", valid_through: "2017-05-01 00:00:00", image_file_name: "3.JPG", image_content_type: "image/jpeg", image_file_size: 1372943, image_updated_at: "2017-04-01 17:20:25", company_id: 1, branch_id: 1},
  {name: 'Short', kms_cost: 50, available_units: 10, description: 'Short Running', valid_from: "2017-04-01 00:00:00", valid_through: "2017-05-01 00:00:00", image_file_name: "3.JPG", image_content_type: "image/jpeg", image_file_size: 1372943, image_updated_at: "2017-04-01 17:20:25", company_id: 1, branch_id: 1},
  {name: 'Gorra', kms_cost: 20, available_units: 50, description: 'Gorra Running', valid_from: "2017-04-01 00:00:00", valid_through: "2017-05-01 00:00:00", image_file_name: "3.JPG", image_content_type: "image/jpeg", image_file_size: 1372943, image_updated_at: "2017-04-01 17:20:25", company_id: 1, branch_id: 1},
  {name: 'Pulsometro', kms_cost: 1000, available_units: 1, description: 'Pulsometro Running', valid_from: "2017-03-01 00:00:00", valid_through: "2017-04-01 00:00:00", image_file_name: "3.JPG", image_content_type: "image/jpeg", image_file_size: 1372943, image_updated_at: "2017-04-01 17:20:25", company_id: 1, branch_id: 1}
])

daniel, diana, marta = Employee.create([
  {name: 'Daniela', email: 'daniela@gmail.com', password: '12345678', phone: '123456789', branch_id: 1, company_id: 1},
  {name: 'Diana', email: 'diana@gmail.com', password: '12345678', phone: '123456789', branch_id: 1, company_id: 1},
  {name: 'Marta', email: 'marta@gmail.com', password: '12345678', phone: '123456789', branch_id: 1, company_id: 1}
])
