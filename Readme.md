## DockerでRails環境の構築
```
docker-compose build
```

## データベースの作成
```
$ docker-compose run --rm web bundle exec rails db:create
```

## サーバーの起動方法(というかDockerの起動)
```
$ docker-compose up -d
```

## サーバーの落とし方
```
$ docker-compose down
```