# coding: utf-8
module Teamweek
  module Pipes
    class Pipe
      attr_reader :origin, :foreign

      def initialize(origin, foreign)
        @origin = origin
        @foreign = foreign
      end

      def source(options)
        raise 'Pipe flow has not been set.'
      end

      def destination(options)
        raise 'Pipe flow has not been set.'
      end

      def run(options)
        data = pull_foreign(source_options(options))
        push_options = destination_options(options)
        push_options ? push_origin(push_options, data) : data
      end

      private

      def pull_foreign(options)
        source(options).pull
      end

      def push_origin(options, data)
        destination(options).push(data)
      end

    end
  end
end
