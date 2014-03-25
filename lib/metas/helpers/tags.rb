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
              next if content.nil? || !content

              case content
              when String then
                ary << tag_with_correct_property(correct_property, tag, attr, content)
              when Array then
                content.each do |c|
                  ary << tag_with_correct_property(correct_property, tag, attr, c)
                end
              else
                ary << tag_with_correct_property(correct_property, tag, attr, content)
              end
            end
          end.join("\n").html_safe
        end

        def get_meta(attr)
          return meta_main.default_values[attr] if attr !~ /^(\w+)?:(\w+)$/

          split_attr = attr.split(":")
          metas = meta_main.normalize.deep_stringify_keys

          return nil if metas[split_attr[0]].nil?
          metas[split_attr[0]][split_attr[1]]
        end

        private

        def tag_with_correct_property(property, tag, attr, content)
          tag(:meta, { property => meta_property(tag, attr), :content => content }, true, false)
        end

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

ActionView::Base.send :include, Metas::Helpers::Tags::InstanceMethods