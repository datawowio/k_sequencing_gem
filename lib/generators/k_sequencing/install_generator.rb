require 'rails/generators/base'
require 'securerandom'

module KSequencing
  module Generators
    # :nodoc:
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Creates a KSequencing initializer
       and copy locale files to your application.'

      def copy_initializer
        template 'k_sequencing.rb', 'config/initializers/k_sequencing.rb'
      end
    end
  end
end
