# coding: utf-8
module Teamweek
  module Pipes
    extend self

    # Registered providers collection.
    def registrations
      @registrations ||= {}
    end

    # Defines pipe for provider.
    #
    # ==== Attributes
    # * +provider+ - Identifier of integrated service.
    # * +flow+ - Flow direction. Teamweek::Pipes::Flows::Pull
    # * +options+ - Options of registration.
    # * +options.service+ - Integrated service.
    #
    # ==== Examples
    #   Teamweek::Pipes.define :test, Teamweek::Pipes::Flows::Pull do |source|
    #     source.name 'Test'
    #     source.description '...'
    #     source.pipe :users, :users
    #     source.pipe :tasks, :todos
    #     source.pipe :tasks, :events, -> options { TestService.get_events }
    #   end
    def define(provider, flow, options = {}, &block)
      return unless block_given?

      registrations[flow] ||= {}
      registrations[flow][provider.to_sym] ||= build(options, flow, &block)
    end

    def pull(provider, origin, foreign)
      registrations[Flows::Pull].fetch(provider).build(origin, foreign)
    end

    private

    def build(options, flow, &block)
      Registration.build(options, flow, &block)
    end
  end
end
