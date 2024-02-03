# ベースイメージを指定
FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./setup.sh ./setup.sh

RUN chmod 755 ./setup.sh
# RUN ./setup.sh

# ポート3306を公開
EXPOSE 3306

RUN service mysql start
# mariadbをフォアグラウンドで起動
CMD ["bash", "./setup.sh"]
# CMD ["mysqld", "--console"]
# CMD ["mysqld_safe"]
# # 必要なパッケージをインストール
# RUN apk update
# RUN apk add install mariadb-server
# RUN apk update && apk add --no-cache mariadb mariadb-client

# # # MariaDBのデータディレクトリを作成
# RUN mkdir -p /var/lib/mysql
# RUN mkdir -p /usr/local/mysql/var/
# RUN mkdir -p /run/mysqld
	
# # # データディレクトリの所有者を設定
# RUN chown -R mysql:mysql /var/lib/mysql
# RUN  
# RUN chown -R mysql:mysql /usr/local/mysql/var/

# # # 設定ファイルをコピー
# COPY ./conf/my.cnf /etc/mysql/my.cnf
 
# # ポート3306を公開
# EXPOSE 3306

# MariaDBをフォアグラウンドで起動し、ログを標準出力に出力
# CMD ["mysqld", "--user=mysql", "--console"]


# FROM alpine:3.13

# RUN	apk update && apk upgrade && apk add --no-cache \
#         mariadb \
#         mariadb-client
        
# COPY tools/configure.sh /tmp/configure.sh

# ENTRYPOINT ["sh", "/tmp/configure.sh"]