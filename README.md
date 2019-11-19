## Documentation

- https://graphql-ruby.org/getting_started
- https://dry-rb.org/gems/dry-types/1.2

## Run example

```
bundle install
ruby graphql-api.rb "query {users {projects {priority} } }"
```

## What if we want to choose root object, based on the content of the query?

We can use custom Resolver:

```
module API
  Definition = File.read("api.schema")
  Resolvers = {
    "Mutation" => {
      "incrementCounter" => ->(o, a, c) {
        counter = Counter.find(a["id"])
        counter.increment
      },
      "decrementCounter" => ->(o, a, c) {
        counter = Counter.find(a["id"])
        counter.decrement
      },
      "setCounter" => ->(o, a, c) {
        counter = Counter.find(a["id"])
        counter.set(a["value"])
      },
      "nextPage" => -> (o, a, c) {
        book = Book.current
        book.next_page
      },
      "prevPage" => -> (o, a, c) {
        book = Book.current
        book.prev_page
      },
    },
    "Query" => {
      "counter" => ->(o, a, c) { Counter.find(a["id"]) },
      "time" => ->(o, a, c) { Time.now},
      "translate" => ->(o, a, c) { Dictionary.translate(a["term"]) },
      "book" => ->(o, a, c) { Book.current },
      "mecab" => ->(o, a, c) { Mecab.split(a["text"]) },
      "history" => ->(o, a, c) { Dictionary.history(a["date"]) }
    }
  }

  Schema = GraphQL::Schema.from_definition(Definition, default_resolve: Resolvers)
end

def handler(event:, context:)
  API::Schema.execute(event["body"], variables: event["variables"]).as_json
end

```
