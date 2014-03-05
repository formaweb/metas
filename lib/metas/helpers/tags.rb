require 'action_view'

module Metas
  module Helpers
    module Tags
      module InstanceMethods
        include ActionView::Helpers::TagHelper

        def meta_tags
          meta = Metas::Main.new(controller)

          meta.normalize.each_with_object([]) do |(tag, values), ary|
            correct_property = meta.options[:irregular][tag] || meta.options[:irregular][:default]

            values.each do |attr, content|
              ary << content_tag(:meta, nil, correct_property => meta_property(tag, attr), content: content)
            end
          end.join("\n")
        end

        private

        def meta_property(tag, attr)
          "#{tag}:#{attr}"
        end
      end
    end
  end
end