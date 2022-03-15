# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

20.times do |time|
  url = URI("https://api.themoviedb.org/3/movie/popular?#{Rails.application.credentials.tmdb[:api_key]}&page=#{time + 1}")
  categories = { 28 => 'action', 12 => 'adventure', 16 => 'animation', 35 => 'comedy', 80 => 'crime',
                 99 => 'documentary', 18 => 'drama', 10_751 => 'family', 14 => 'fantasy', 36 => 'history',
                 27 => 'horror', 10_402 => 'music', 9648 => 'mystery', 10_749 => 'romance', 878 => 'science_fiction',
                 10_770 => 'tv_movie', 53 => 'thriller', 10_752 => 'war', 37 => 'western' }

  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true

  request = Net::HTTP::Get.new(url)

  response = https.request(request)
  movie_array = JSON.parse(response.read_body)
  movies = movie_array['results']
  modified_movies = []
  movies.each do |movie|
    id = movie['id']
    genre_ids = movie['genre_ids']
    i = 0
    while i < genre_ids.size
      genre_ids[i] = categories[genre_ids[i]]
      i += 1
    end
    movie_name = movie['title']
    summary = movie['overview']
    release_date = movie['release_date']
    score = movie['vote_average']
    poster_path = movie['poster_path']
    modified_movies << [id, movie_name, genre_ids, summary, score, release_date, poster_path]
  end

  modified_movies.each do |movie|
    movie_id = movie[0]
    indi_url = URI("https://api.themoviedb.org/3/movie/#{movie_id}?#{Rails.application.credentials.tmdb[:api_key]}")
    https = Net::HTTP.new(indi_url.host, indi_url.port)
    https.use_ssl = true

    indi_request = Net::HTTP::Get.new(indi_url)
    indi_response = https.request(indi_request)
    movie_response = JSON.parse(indi_response.read_body)

    runtime = movie_response['runtime']
    homepage = movie_response['homepage']
    country = movie_response['production_countries'][0].blank? ? nil : movie_response['production_countries'][0]['name']
    status = movie_response['status']
    movie.push(runtime, status, homepage, country)

    tmdb_id = movie[0]
    movie_name = movie[1]
    categories = movie[2]
    summary = movie[3]
    release_year = movie[5].slice(0..3)
    release_date = movie[5]
    poster_path = movie[6]
    runtime = movie[7]
    country = movie[-1]
    homepage = movie[-2]
    status = movie[-3]

    movie = Movie.new(
      movie_name: movie_name,
      poster_path: poster_path,
      runtime: runtime,
      release_year: release_year,
      release_date: release_date,
      country: country,
      release_state: status,
      summary: summary,
      tmdb_id: tmdb_id,
      homepage: homepage
    )
    movie.save!
    j = 0
    while j < categories.size
      if categories[0].blank?
        movie_category = MovieCategory.new(movie_id: movie.id)
      elsif j.zero?
        movie_category = MovieCategory.new(movie_id: movie.id, "#{categories[j]}": true)
      else
        movie_category[categories[j]] = true
      end
      j += 1
    end
    movie_category.save!
  end
end

200.times do
  user_num = User.all.length
  begin
    nickname = Faker::FunnyName.name
    email = Faker::Internet.free_email
    self_intro = Faker::Lorem.paragraph(sentence_count: 1..4)
    password = Faker::Internet.password
    user = User.new(
      nickname: nickname,
      email: email,
      password: password,
      self_intro: self_intro
    )
    user.skip_confirmation!
    user.save!
  rescue StandardError
    retry if user_num <= 200
    raise
  end
end

800.times do
  mark_num = Mark.all.length
  begin
    score = Faker::Number.between(from: 0.5, to: 5.0).round(1)
    contents = %w[最高でした。 まずまずでした。 あんまり面白くなかった。 個人的には面白かった。 物語は面白かったが、もう少し音響やCGに拘るべきだ。
                  時間を無駄にした気分です。 とにかく俳優陣がイケメンでした。 ２度とみる気が起きません。 この監督の次回作が楽しみです。 すごく面白かった。続編も絶対見に行く。]
    mark = Mark.new(
      score: score,
      content: contents.sample,
      movie_id: Random.rand(1..400),
      user_id: Random.rand(1..200)
    )
    mark.save!
  rescue StandardError
    retry if mark_num <= 800
    raise
  end
end

1800.times do
  clip_num = Clip.all.length
  begin
    clip = Clip.new(
      movie_id: Random.rand(1..400),
      user_id: Random.rand(1..200)
    )
    clip.save!
  rescue StandardError
    retry if clip_num <= 1800
    raise
  end
end

500.times do
  contents = %w[わかります。 それは知りませんでした。 本当ですか？見に行こうかな〜 あんまり評判良くない気がしたんですが、そうではないみたいですね。 この監督が脚本をしている作品も是非見てみてください
                主演の〇〇ちゃん、とにかく可愛かったですよね。 それは草。 出直してこい。 www。 大草原不可避。]
  comment = Comment.new(
    content: contents.sample,
    user_id: Random.rand(1..200),
    mark_id: Random.rand(1..800)
  )
  comment.save!
end

1600.times do
  favo_num = Favorite.all.length
  begin
    favorite = Favorite.new(
      user_id: Random.rand(1..200),
      mark_id: Random.rand(1..800)
    )
    favorite.save!
  rescue StandardError
    retry if favo_num <= 1600
    raise
  end
end

array = []
fac = [*(1..200)].combination(2).to_a
while array.size < 1500
  array << fac.sample
  array.uniq!
end
i = 0
while i < 1500
  rela_num = Relationship.all.length
  begin
    follower_id = array[i][0]
    followed_id = array[i][1]
    relationship = Relationship.new(
      follower_id: follower_id,
      followed_id: followed_id
    )
    relationship.save!
  rescue StandardError
    return if rela_num == 1500

    retry if rela_num < 1500
  end
  i += 1
end
