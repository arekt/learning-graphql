require "json"
require "dry-types"
require "dry-struct"

module Types
  include Dry.Types()
end

class Model < Dry::Struct
  def to_json(options={})
    attributes.to_json(options)
  end
end

class Project < Model
  attribute :name, Types::Strict::String
  attribute :priority, Types::Integer.optional.default(1)
end

class User < Model
  attribute :name,  Types::Strict::String
  attribute :projects, Types.Array(Project)
  attribute :tags, Types.Array(Types::String)
  attribute :admin, Types::Bool.optional.default(false)
end
