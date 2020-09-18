# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users= [
# { name: 'takumi', email: 'music.life201@gmail.com', password: 'aaaa1111' },
{ name: 'kanritarou', email: 'kanri1@yahoo.com', password: 'aaaa1111' },
{ name: 'kanrijirou', email: 'kanri2@yahoo.com', password: 'aaaa2222' },
]
users.each do |record|
  User.create!(record) unless User.find_by(email: record[:email])
end

# User.create(
#   name: 'takumi',
#   email: 'aa1@gmail.com',
#   password: 'aaaa1111' ,
# )
# Address.create(
#   post: "1112111",
#   preficture: "東京都",
#   city: "渋谷区道玄坂",
#   block: "２丁目23-12",
#   building: "フォンティスビル7F",
#   tell_number: "05031873522",
#   user_id: 1,
#   first_name: "成",
#   first_furigana: "なり",
#   last_name: "真子",
#   last_furigana: "まこ",
# )
# [
#   ['パソコン', 2000, img: File.open('./app/assets/images/img_1.jpg'), '商品紹介デイリーで使いやすいカジュアルデザインの高機能防水シューズです。ランニング&トレーニング向けに開発したスポーツシューズ『Ultra Velocity』のXTRAFOAMボトム構造を採用し、衝撃吸収性と安定性を向上。シンプルながらデザイン性に優れるアッパーには、ストレッチニットにGORE-TEX INVISIBLE FITメンブレンを直接接着させることで、防水透湿機能に快適な履き心地をもたせています。また、表に縫製箇所を見せないニット成形に仕上げ、軽量かつ優れたフィット感を実現。突然の雨などの天候の変化を気にせず日常使いできる防水シューズとして活用できます。'],
#   ['ipad', 3000, img: File.open('./app/assets/images/img_1.jpg'), '商品紹介デイリーで使いやすいカジュアルデザインの高機能防水シューズです。ランニング&トレーニング向けに開発したスポーツシューズ『Ultra Velocity』のXTRAFOAMボトム構造を採用し、衝撃吸収性と安定性を向上。シンプルながらデザイン性に優れるアッパーには、ストレッチニットにGORE-TEX INVISIBLE FITメンブレンを直接接着させることで、防水透湿機能に快適な履き心地をもたせています。また、表に縫製箇所を見せないニット成形に仕上げ、軽量かつ優れたフィット感を実現。突然の雨などの天候の変化を気にせず日常使いできる防水シューズとして活用できます。']
# ].each do |name, price, img, description|
#   Product.create!(
#     { product_name: name, price: price, img: img, description: description}
#   )

#   User.create!(
#   [
#     {product_name: 'パソコン',price: 2000, img: File.open('./app/assets/images/img_1.jpg'), description: '商品紹介デイリーで使いやすいカジュアルデザインの高機能防水シューズです。ランニング&トレーニング向けに開発したスポーツシューズ『Ultra Velocity』のXTRAFOAMボトム構造を採用し、衝撃吸収性と安定性を向上。シンプルながらデザイン性に優れるアッパーには、ストレッチニットにGORE-TEX INVISIBLE FITメンブレンを直接接着させることで、防水透湿機能に快適な履き心地をもたせています。また、表に縫製箇所を見せないニット成形に仕上げ、軽量かつ優れたフィット感を実現。突然の雨などの天候の変化を気にせず日常使いできる防水シューズとして活用できます。'},
#     {product_name: 'ipad', price: 3000, img: File.open('./app/assets/images/img_1.jpg'), description: '商品紹介デイリーで使いやすいカジュアルデザインの高機能防水シューズです。ランニング&トレーニング向けに開発したスポーツシューズ『Ultra Velocity』のXTRAFOAMボトム構造を採用し、衝撃吸収性と安定性を向上。シンプルながらデザイン性に優れるアッパーには、ストレッチニットにGORE-TEX INVISIBLE FITメンブレンを直接接着させることで、防水透湿機能に快適な履き心地をもたせています。また、表に縫製箇所を見せないニット成形に仕上げ、軽量かつ優れたフィット感を実現。突然の雨などの天候の変化を気にせず日常使いできる防水シューズとして活用できます。'}
#   ]
# )