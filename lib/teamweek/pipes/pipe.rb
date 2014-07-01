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
        push_origin(options, pull_foreign(options))
      end

      def pull_foreign(options)
        source(source_options(options)).pull
      end

      def push_origin(options, data)
        destination(destination_options(options)).push(data)
      end

    end
  end
end
