require "dry-types"
require "dry-struct"
require "json"
require_relative "model"

module API
  class User
    def self.all
      UserCollection.new(users: [
        {
          name: "Smith",
          projects: [
            {name: "foo", priority: 5},
            {name: "bar"}
          ],
          tags: ["foo"]
        },
        {
          name: "田中",
          projects: [
            {name: "フガ", priority: 2},
            {name: "ホゲ", priority: 3}
          ],
          tags: ["foo", "bar"],
          admin: true
        }
      ])
    end
  end
end
