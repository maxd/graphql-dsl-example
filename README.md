# GraphQL Client and Server example

This example shows how to use [GraphQL DSL](https://github.com/maxd/graphql-dsl) gem.

# How to run example?

1. Configure and run server with commands:

```bash
cd server

bundle config set --local path 'vendor/bundle'
bundle install

rails s -p 4000
```

2. Configure and run client with commands:

```bash
cd client

bundle config set --local path 'vendor/bundle'
bundle install

rails s
```

3. Open http://localhost:3000 URL in your browser.