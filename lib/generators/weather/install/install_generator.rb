module Weather
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'This generator creates an initializer file at config/initializers'

      def add_initializer
        template 'weather.rb', 'config/initializers/weather.rb'
      end
    end
  end
end
