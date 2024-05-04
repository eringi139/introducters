Admin.create!(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD']
)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sanae = Customer.find_or_create_by!(email: "aaa@aaa") do |customer|
  customer.last_name = "佐藤"
  customer.first_name ="さなえ"
  customer.password = "000000"
end

mizuki = Customer.find_or_create_by!(email: "bbb@bbb") do |customer|
  customer.last_name = "桐谷"
  customer.first_name ="瑞希"
  customer.password = "000000"
end

risa = Customer.find_or_create_by!(email: "ccc@ccc") do |customer|
  customer.last_name = "鈴木"
  customer.first_name ="里沙"
  customer.password = "000000"
end

genre1 = Genre.create!(
  name: "J-POP"
)

genre2 = Genre.create!(
  name: "ボカロ"
)

Post.find_or_create_by!(title: "音楽A") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.body = "Aメロからサビにかけてのコードがお気に入りです。"
  post.genre_id = genre1.id
  post.customer = sanae
end

Post.find_or_create_by!(title: "音楽B") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post.body = "アップテンポな曲調で、聴くと元気がでます。 ドライブで流すのもおすすめです。"
  post.genre_id = genre1.id
  post.customer = mizuki
end

Post.find_or_create_by!(title: "音楽C") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  post.body = "ボーカロイド楽曲はテンポが速いものがよく流行るイメージですが、ゆったりとした曲調で心が落ち着くボカロも素晴らしいということを多くの人に知ってもらいたいです。"
  post.genre_id = genre2.id
  post.customer = risa
end

