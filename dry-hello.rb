require "graphql"
require_relative "model"

Schema = GraphQL::Schema.from_definition(
  File.read("hello.schema")
)
#Schema = GraphQL::Schema.from_definition(Definition, default_resolve: Resolvers)

#result = Schema.execute('query {users {name}}', root_value: @response)
result = Schema.execute(ARGV[0], root_value: @response)

puts result.to_json
