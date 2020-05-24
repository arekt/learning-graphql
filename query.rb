require_relative "bundle/bundler/setup.rb"
require "graphql"
require_relative "users_repository"

Schema = GraphQL::Schema.from_definition(
  File.read("hello.schema")
)

query = ARGV[0] || gets.chomp
result = Schema.execute(query, root_value: UsersRepository.open("users.json"))
puts result.to_json
