# coding: utf-8
require 'teamweek-ruby'

module Teamweek
  module Pipes
    module Repositories
      extend self

      def build(origin, options)
        origin_class(origin).new(build_client(options))
      end

      private

      def build_client(options)
        client.new(
          options[:http_client],
          options[:workspace],
          base_uri: options[:uri]
        )
      end

      def client
        Teamweek::Api::Client
      end

      def origin_class(origin)
        class_name = origin.to_s.capitalize
        const_get(class_name)
      end
    end
  end
end
