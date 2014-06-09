require 'spec_helper'
require 'teamweek/pipes'

module Teamweek
  module Pipes
    class TestService
      def initialize(options)
      end

      def pull
        [{ name: 'Tester', email: nil, foreign_id: 1 }]
      end
    end

    RSpec.describe 'Array pipe' do
      let(:origin) { { workspace: 1 } }
      let(:foreign) { { workspace: 2 } }
      let(:options) { { origin: origin, foreign: foreign } }

      it 'pulls from source and pushes to destination using service' do
        Pipes.define :test, Flows::Pull, service: TestService do |source|
          source.name 'Test provider'

          source.pipe :users, :users
        end

        puts Pipes.pull(:test, :users, :users).run(options)
      end

      it 'pulls from source and pushes to destination using block' do
        Pipes.define :test, Flows::Pull do |source|
          source.name 'Test provider'

          source.pipe :users, :users, -> options { TestService.new(options).pull }
        end

        puts Pipes.pull(:test, :users, :users).run(options)
      end
    end
  end
end
