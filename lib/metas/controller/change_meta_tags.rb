module Metas
  module Controller
    module ChangeMetaTags
      module InstanceMethods

        def change_meta_tags(&block)
          self.define_singleton_method(:default_meta_tags) do
            super().merge(block.call)
          end
        end

      end
    end
  end
end

if defined? ActionController::Base
  ActionController::Base.send :include, Metas::Controller::ChangeMetaTags::InstanceMethods
end