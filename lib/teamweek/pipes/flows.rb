# coding: utf-8
module Teamweek
  module Pipes
    module Flows
      module Pull
        def source(options)
          foreign.call(options)
        end

        def source_options(options)
          options.fetch(:foreign)
        end

        def destination(options)
          origin.call(options)
        end

        def destination_options(options)
          options.fetch(:origin)
        end
      end

      module Push
        def source(options)
          origin.call(options)
        end

        def source_options(options)
          options.fetch(:origin)
        end

        def destination(options)
          foreign.call(options)
        end

        def destination_options(options)
          options.fetch(:foreign)
        end
      end
    end
  end
end
