require 'singleton'
require_relative 'router'
require_relative 'controller'

module Simpler
  class Application
    
    include Singleton

    def initialize
      @router = Router.new
    end

    def bootstrap!
      require_app
      require_routes

    end

    def call(env)
      route = @router.route_for(env)
      controller = route.controller.new(env)
      action = route.action

      make_response(controller, action)
    end

    def routes(&block)
      @router.instance_eval(&block)
    end

    private

    def make_response(controller, action)
      controller.make_response(action)
    end

    def require_app
      
    end

    def require_routes
      
    end
  end
end

