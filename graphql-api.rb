require "graphql"
require_relative "model"

Schema = GraphQL::Schema.from_definition(
  File.read("hello.schema")
)

#result = Schema.execute('query {users {name}}', root_value: @response)
query = ARGV[0]
result = Schema.execute(query, root_value: @response)

puts result.to_json
