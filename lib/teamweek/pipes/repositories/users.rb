# coding: utf-8
module Teamweek
  module Pipes
    module Repositories
      class Users
        attr_reader :client

        def initialize(client)
          @client = client
        end

        def push(users)
          client.import_users(users)
        end
      end
    end
  end
end
