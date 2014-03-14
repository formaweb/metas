require 'yaml'
require 'active_support/core_ext/hash'

module Metas
  class Main
    attr_reader :controller, :values, :default_values, :options

    def initialize(controller)
      @controller = controller
      @values = controller.default_meta_tags
      @default_values = default_values_social
      @options = YAML.load_file(Rails.root.join('config/metas.yml')).deep_symbolize_keys[:metas]
    end

    def normalize
      ignore_keys = default_values.keys
      all_tags_included = insert_all(values)

      all_tags_included.each_with_object({}) do |(social, tags), hsh|
        next if ignore_keys.include?(social)

        hsh[social] = tags
      end
    end

    private

    def default_values_social
      values.each_with_object({}) do |(key, value), hsh|
        next if value.kind_of? Hash

        hsh[key] = value
      end
    end

    def insert_all(meta_tags)
      meta_tags.each_with_object({}) do |(key, tags), hsh|
        if tags.kind_of?(Hash)
          hsh[key] = tags

          default_values.each do |key_social, value_social|
            next if options[:same][key_social].nil? || options[:same][key_social][key].nil?

            correct_key = options[:same][key_social][key].to_sym
            hsh[key][correct_key] = values[key].fetch(correct_key){ value_social }
          end
        else
          hsh[key] = tags
        end
      end
    end
  end
end