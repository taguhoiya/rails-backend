# frozen_string_literal: true

# 300.times do
#   movie_name = Faker::Movie.title
#   running_time = Faker::Number.between(from: 90, to: 180)
#   release_year = Faker::Number.between(from: 1960, to: 2021)
#   release_date = Faker::Date.between(from: 2.days.ago, to: Date.today)
#   country = Faker::Nation.nationality
#   categories = %w[non-fiction romance horror war music musical sports SF comedy action
#                   adventure documentary suspense thiller fantasy gang mystery history biography human-story]
#   release_states = %w[playing closed]
#   summary = Faker::Lorem.paragraph(sentence_count: 3..10)
#   movie = Movie.new(
#     movie_name: movie_name,
#     running_time: running_time,
#     release_year: release_year,
#     release_date: release_date,
#     country: country,
#     category: categories.sample,
#     release_state: release_states.sample,
#     summary: summary
#   )
#   movie.save!
# end

# 200.times do
#   user_num = User.all.length
#   begin
#     nickname = Faker::FunnyName.name
#     email = Faker::Internet.free_email
#     password = Faker::Internet.password
#     user = User.new(
#       nickname: nickname,
#       email: email,
#       password: password
#     )
#     user.skip_confirmation!
#     user.save!
#   rescue StandardError
#     retry if user_num <= 200
#     raise
#   end
# end


# 600.times do
#   mark_num = Mark.all.length
#   begin
#     score = Faker::Number.between(from: 0.5, to: 5.0).round(1)
#     contents = %w[最高でした。 まずまずでした。 あんまり面白くなかった。 個人的には面白かった。 物語は面白かったが、もう少し音響やCGに拘るべきだ。
#                   時間を無駄にした気分です。 とにかく俳優陣がイケメンでした。 ２度とみる気が起きません。 この監督の次回作が楽しみです。 すごく面白かった。続編も絶対見に行く。]
#     mark = Mark.new(
#       score: score,
#       content: contents.sample,
#       movie_id: Random.rand(1..300),
#       user_id: Random.rand(1..200)
#     )
#     mark.save!
#   rescue StandardError
#     retry if mark_num <= 900
#     raise
#   end
# end

# 1500.times do
#   clip_num = Clip.all.length
#   begin
#     clip = Clip.new(
#       movie_id: Random.rand(1..300),
#       user_id: Random.rand(1..200)
#     )
#     clip.save!
#   rescue StandardError
#     retry if clip_num <= 1500
#     raise
#   end
# end

# 500.times do
#   contents = %w[わかります。 それは知りませんでした。 本当ですか？見に行こうかな〜 あんまり評判良くない気がしたんですが、そうではないみたいですね。 この監督が脚本をしている作品も是非見てみてください
#                 主演の〇〇ちゃん、とにかく可愛かったですよね。 それは草。 出直してこい。 www。 大草原不可避。]
#   comment = Comment.new(
#     content: contents.sample,
#     user_id: Random.rand(1..200),
#     mark_id: Random.rand(1..900)
#   )
#   comment.save!
# end

# 1600.times do
#   favo_num = Favorite.all.length
#   begin
#     favorite = Favorite.new(
#       user_id: Random.rand(1..200),
#       mark_id: Random.rand(1..900)
#     )
#     favorite.save!
#   rescue StandardError
#     retry if favo_num <= 1600
#     raise
#   end
# end

# array = []
# fac = [*(1..200)].combination(2).to_a
# while array.size < 1000
#   array << fac.sample
#   array.uniq!
# end
# i = 0
# while i < 1000
#   rela_num = Relationship.all.length
#   begin
#     follower_id = array[i][0]
#     followed_id = array[i][1]
#     relationship = Relationship.new(
#       follower_id: follower_id,
#       followed_id: followed_id
#     )
#     relationship.save!
#   rescue StandardError
#     retry if rela_num < 1000
#     raise
#   end
#   i += 1
# end
i = 1
300.times do
  self_intro = Faker::Lorem.paragraph(sentence_count: 1..4)
  User.find(i).update!(self_intro: self_intro)
  i += 1
end
