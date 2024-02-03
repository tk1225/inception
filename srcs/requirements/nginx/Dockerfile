# ベースイメージを指定
FROM debian:buster
RUN apt update
RUN apt-get update
# NGINXのダウンロードとインストール
RUN apt install nginx -y
RUN apt install sudo -y
RUN apt install openssl -y
RUN mkdir -p /etc/nginx/ssl
# カスタム設定ファイルをコンテナにコピー
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/CN=takuokam.42.fr"
RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/sites-available/default.conf
RUN  ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

RUN chmod 755 /var/www
RUN chown -R 755 /var/www

# ポート80を公開
EXPOSE 443

# NGINXを起動
CMD ["nginx", "-g", "daemon off;"]
