# coding: utf-8
require 'teamweek-ruby'

module Teamweek
  module Pipes
    module Repositories
      extend self

      def build(options)
        Users.new(client(options[:workspace], options[:token], options[:uri]))
      end

      def client(workspace, token, uri = nil)
        Teamweek::Api::Client.new(workspace, token, base_uri: uri)
      end
    end
  end
end
