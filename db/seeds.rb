# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(
  name: "Chikano",
  email: "chikano@email.com",
  password: "123456",
  admin: true
)

users = [
  { name: "Hasshy", email: "hasshy@email.com", password: "123456", admin: false },
  { name: "Urushi", email: "urushi@email.com", password: "123456", admin: false },
  { name: "Muramatsu", email: "muramatsu@email.com", password: "123456", admin: false },
  { name: "Ozawa", email: "ozawa@email.com", password: "123456", admin: false },
  { name: "Okimon", email: "okimon@email.com", password: "123456", admin: false },
  { name: "Yoshida", email: "yoshida@email.com", password: "123456", admin: false },
  { name: "Ishii", email: "ishii@email.com", password: "123456", admin: false },
  { name: "Yamada", email: "yamada@email.com", password: "123456", admin: false }
]

users.each do |user|
  User.create!(user)
end

projects = [
  { user_id: 1, name: "without" },
  { user_id: 1, name: "KANARI" },
  { user_id: 2, name: "Cityspeak" },
  { user_id: 1, name: "チカノ個人用" },
  { user_id: 2, name: "はっしー個人用" }
]

projects.each do |project|
  Project.create!(project)
end

joins = [
  { project_id: 1, user_id: 3 },
  { project_id: 1, user_id: 4 },
  { project_id: 1, user_id: 5 },
  { project_id: 2, user_id: 6 },
  { project_id: 2, user_id: 7 },
  { project_id: 2, user_id: 8 },
  { project_id: 3, user_id: 1 },
  { project_id: 3, user_id: 7 },
  { project_id: 3, user_id: 9 }
]

joins.each do |join|
  Join.create!(join)
end

audios = [
  { project_id: 1, user_id: 1, title: "2023song1", bpm: 182, key: "D", comment: "新曲です。途中で拍子が3拍子に変わります", file: File.open('./app/assets/files/2023song_1.mp3') },
  { project_id: 4, user_id: 1, title: "2023song3", bpm: 100, key: "E", comment: "とりあえずギターのみ", file: File.open('./app/assets/files/2023song3.mp3') },
  { project_id: 1, user_id: 1, title: "2023song5", bpm: 159, key: "D", comment: "新曲です。Urushiは左チャンネルのギターをコピーしておいて!", file: File.open('./app/assets/files/2023song5-2.mp3') },
  { project_id: 2, user_id: 1, title: "2023プリプロ", bpm: 82, key: "D", comment: "今日のリズム隊のプリプロです", file: File.open('./app/assets/files/newsong.mp3') },
  { project_id: 4, user_id: 1, title: "2023song6", bpm: 120, key: "E", comment: "新曲(ドラム打ち込みのみ)", file: File.open('./app/assets/files/2023song6drum.mp3') }
]

audios.each do |audio|
  Audio.create!(audio)
end

responses = [
  { audio_id: 3, user_id: 3, comment: "オッケー!耳コピしとく" },
  { audio_id: 3, user_id: 4, comment: "ドラムだけの音声もらえる?" },
  { audio_id: 3, user_id: 1, comment: "送る！", file: File.open('./app/assets/files/2023song5.mp3') },
  { audio_id: 4, user_id: 6, comment: "もう少しテンポ遅い方がいいね" },
  { audio_id: 5, user_id: 1, comment: "一旦お蔵入り" }
]

responses.each do |response|
  Response.create!(response)
end
