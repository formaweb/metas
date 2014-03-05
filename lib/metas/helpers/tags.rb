require 'action_view'

module Metas
  module Helpers
    module Tags
      module InstanceMethods
        include ActionView::Helpers::TagHelper

        def meta_tags
          meta_main.normalize.each_with_object([]) do |(tag, values), ary|
            correct_property = meta_main.options[:irregular][tag] || meta_main.options[:irregular][:default]

            values.each do |attr, content|
              ary << content_tag(:meta, nil, correct_property => meta_property(tag, attr), content: content)
            end
          end.join("\n")
        end

        def get_meta(attr)
          split_attr = attr.split(":")
          metas = meta_main.normalize.deep_stringify_keys
          return nil if metas[split_attr[0]].nil?

          metas[split_attr[0]][split_attr[1]]
        end

        private

        def meta_property(tag, attr)
          "#{tag}:#{attr}"
        end

        def meta_main
          Metas::Main.new(controller)
        end
      end
    end
  end
end