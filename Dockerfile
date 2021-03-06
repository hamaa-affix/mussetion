FROM ruby:2.7.1

# リポジトリを更新し依存モジュールをインストール
RUN apt-get update -qq && \
        apt-get install -y build-essential \
        nodejs \
        procps

# yarnパッケージ管理ツールインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
        apt-get update && apt-get install -y yarn

# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
        apt-get install -y nodejs

# ルート直下にwebappという名前で作業ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
#RUN mkdir /webapp
WORKDIR /mussertion

# ホストのGemfileとGemfile.lockをコンテナにコピー
ADD Gemfile /mussertion/Gemfile
ADD Gemfile.lock /mussertion/Gemfile.lock

# bundle installの実行
RUN bundle install

# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
#COPY . /mussertion

# puma.sockを配置するディレクトリを作成
RUN mkdir -p /mussertion/tmp/sockets

CMD ["rails", "s"]
