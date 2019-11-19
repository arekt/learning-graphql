require "graphql"
require_relative "api"

Schema = GraphQL::Schema.from_definition(
  File.read("hello.schema")
)

query = ARGV[0]
result = Schema.execute(query, root_value: API::User.all)
puts result.to_json
