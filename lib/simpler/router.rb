require_relative 'router/route'
require 'byebug'

module Simpler
  class Router

    def initialize
      @routes = []  
    end

    def get(path, route_point)
      add_route(:get, path, route_point)      
    end

    def post(path, route_point)
      add_route(:post, path, route_point)   
    end

    def route_for(env)
      method = env['REQUEST_METHOD'].downcase.to_sym
      path = env['PATH_INFO']

      

      @routes.find { |route| route.match?(method, path) }  
    end

    private

    def add_route(method, path, route_point)
      route_point = route_point.split('#')
      action = route_point.last
      controller = controller_from_string(route_point.first)
      route = Route.new(method, path, controller, action)

      @routes.push(route)     
       
    end

    def controller_from_string(controller_name)
      Object.const_get("#{controller_name.capitalize}Controller")
    end
  end
  
end