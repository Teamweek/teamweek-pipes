# coding: utf-8
module Teamweek
  module Pipes
    class Repository
      attr_accessor :client
      attr_accessor :origin

      def initialize(client, repository)
        @client = client
        @origin = repository
      end

      def push(entities)
        origin.call(client, entities)
      end

    end
  end
end
