module Simpler
  class View
    def initialize(env)
      @env = env
    end

    def render
      File.read(template_path)
    end

    private

    def template_path
      Simpler.root.join('app/views/tests/index.html')
    end
  end
  
end