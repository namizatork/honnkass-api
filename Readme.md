```
$ docker-compose run web rails new . --force --no-deps --database=postgresql
```

```
$ docker-compose build
```

## config/database.yml
```
# 設定箇所のみ抜粋
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password:
  pool: 5
:
:
development:
  <<: *default
  database: honnkass_api_development
:
:
test:
  <<: *default
  database: honnkass_api_test
```

```
$ docker-compose run web rake db:create
```

```
$ docker-compose up
```