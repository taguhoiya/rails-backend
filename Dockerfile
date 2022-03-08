FROM ruby:3.0.2

# 必要なパッケージのインストール（Rails6からWebpackerがいるので、yarnをインストールする）
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
        && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
        && apt-get update -qq \
        && apt-get install -y build-essential libpq-dev nodejs yarn postgresql-client

# 作業ディレクトリの作成
RUN mkdir /rails-backend
WORKDIR /rails-backend

# ホスト側（ローカル）（左側）のGemfileを、コンテナ側（右側）のGemfileへ追加
ADD ./Gemfile /rails-backend/Gemfile
ADD ./Gemfile.lock /rails-backend/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
ADD . /rails-backend




# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]