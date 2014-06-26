# coding: utf-8
require 'teamweek-ruby'
module Teamweek
  module Pipes
    module Repositories
      extend self

      def build(origin, options)
        Teamweek::Pipes::Repository.new(
          build_client(options),
          repositories[origin]
        )
      end

      private

      def build_client(options)
        Teamweek::Api::Client.new(
          options[:http_client],
          options[:workspace],
          base_uri: options[:uri]
        )
      end

      def repositories
        {
          users: -> (client, users) { client.import_users(users) },
          projects: -> (client, projects) { client.import_projects(projects) }
        }
      end
    end
  end
end
