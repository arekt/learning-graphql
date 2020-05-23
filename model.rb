module Types
  include Dry.Types()
end

class Project < Dry::Struct
  attribute :name, Types::Strict::String
  attribute :priority, Types::Integer.optional.default(1)
end

class User < Dry::Struct
  attribute :name,  Types::Strict::String
  attribute :projects, Types.Array(Project)
  attribute :tags, Types.Array(Types::String)
  attribute :admin, Types::Bool.optional.default(false)
end

class UserCollection < Dry::Struct
  attribute :users, Types.Array(User)

  def createUser(params, context)
    User.new(name: params[:name], projects: [], tags: [])
  end
end
