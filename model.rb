require "dry-types"
require "dry-struct"
require "json"

module Types
  include Dry.Types()
end

class Project < Dry::Struct
  attribute  :name, Types::Strict::String
  attribute  :priority, Types::Integer.optional.default(1)
end

class User < Dry::Struct
  attribute  :name,  Types::Strict::String
  attribute :projects, Types.Array(Project)
  attribute :tags, Types.Array(Types::String)
  attribute :admin, Types::Bool.optional.default(false)
end

class UserCollection < Dry::Struct
  attribute :users, Types.Array(User)
end

users = [{
  name: "Smith",
  projects: [
    {name: "foo", priority: 5},
    {name: "bar"}
  ],
  tags: ["foo"],
},
{
  name: "田中",
  projects: [
    {name: "フガ", priority: 2},
    {name: "ホゲ", priority: 3}
  ],
  tags: ["foo", "bar"],
  admin: true
}]
@response = UserCollection.new(users: users)






