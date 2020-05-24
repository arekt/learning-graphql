require_relative "model"

class UsersRepository < Model
  attribute :file_name, Types::Strict::String
  attribute :users, Types.Array(User)

  def self.open(file_name)
    json = File.read(file_name)
    json_users = JSON.parse(json, symbolize_names: true).dig(:users)
    UsersRepository.new(file_name: file_name, users: json_users)
  end

  def createUser(params, context)
    user = User.new(name: params.dig(:input,:name), projects: params.dig(:input,:projects), tags: [])
    users << user
    save
    user
  end

  def save
    File.open(file_name, "w+") do |f|
      f.write(JSON.generate({users: users}))
    end
  end
end
