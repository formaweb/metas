require File.dirname(__FILE__) + "/dummy_controller"

class DumbController < DummyController
  include Metas::Controller::ChangeMetaTags::InstanceMethods

  def change_metas
    change_meta_tags do
      {og: {description: 'another test'}}
    end
  end
end