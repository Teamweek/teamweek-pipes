# coding: utf-8
module Teamweek
  module Pipes
    class Registration
      def self.build(options, flow, &block)
        registration = Registration.new(options, flow)
        block.call(registration)
        registration
      end

      def initialize(options, flow)
        @flow = flow
        @options = options
        @pipes = {}
      end

      def name(value)
        @name = value
      end

      def description(value)
        @description = value
      end

      def pipe(origin, foreign, action = nil)
        @pipes[key(origin, foreign)] = action
      end

      def build(origin, foreign)
        Pipe.new(
          origin_repository,
          get(origin, foreign) || foreign_repository
        ).extend(@flow)
      end

      private

      def key(origin, foreign)
        "#{ origin }:#{ foreign }"
      end

      def get(origin, foreign)
        action = @pipes.fetch(key(origin, foreign))
        -> options { Action.new(action, options) } if action
      end

      def origin_repository
        -> options { Repositories.build(options) }
      end

      def foreign_repository
        -> options { @options.fetch(:service).build(options) }
      end

      class Action
        attr_reader :action, :options

        def initialize(action, options)
          @action = action
          @options = options
        end

        def pull
          action.call(options)
        end

        def push(data)
          action.call(data, options)
        end
      end
    end
  end
end
