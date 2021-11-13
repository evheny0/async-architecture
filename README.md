## Async architecture project


Message broker:
```
docker compose up
```

Auth application:
```
cd auth
bundle exec rails s
```

Tasks application:
```
cd tasks
bundle exec rails s -p 3001
bundle exec karafka server
```

Accounting application:
```
cd tasks
bundle exec rails s -p 3002
bundle exec karafka server
```

Analytics application:
```
cd tasks
bundle exec rails s -p 3003
bundle exec karafka server
```
