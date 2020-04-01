# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tl = [37.809194, -122.477073]       
tr = [37.808176, -122.406435]
bl = [37.709678, -122.501024]         
br = [37.718246, -122.364489]

multiplier = 40;

xinc = (tr[0] - bl[0]) / multiplier;
yinc = (tr[1] - bl[1]) / multiplier;

x, y = bl[0], bl[1];
x2, y2 = tr[0], tr[1];

while (x < x2 && y < y2) do
    Bench.create(description: Faker::Food.dish, lat: x, lng: y);
    x += xinc;
    y += yinc;
end