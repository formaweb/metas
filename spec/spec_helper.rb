Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

require File.dirname(__FILE__) + "/../lib/metas"

module Rails
  def self.root
    Pathname.new(File.dirname(__FILE__))
  end
end