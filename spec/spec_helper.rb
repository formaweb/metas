require 'capybara/rspec'
require File.dirname(__FILE__) + "/../lib/metas"

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

module Rails
  def self.root
    Pathname.new(File.dirname(__FILE__))
  end
end