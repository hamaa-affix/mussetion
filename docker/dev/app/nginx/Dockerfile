FROM nginx:1.15.8

# # インクルード用のディレクトリ内を削除
# RUN rm -f /etc/nginx/conf.d/*

# Nginxの設定ファイルをコンテナにコピー
COPY ./docker/dev/app/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/dev/app/nginx/dev-mussertion.conf /etc/nginx/conf.d/dev-mussertion.conf
# ビルド完了後にNginxを起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf