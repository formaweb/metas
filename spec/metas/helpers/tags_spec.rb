require 'spec_helper'

describe Metas::Helpers::Tags::InstanceMethods do
  include Capybara::RSpecMatchers
  include Metas::Helpers::Tags::InstanceMethods

  before do
    subject.class_eval do
      def controller
        DummyController.new
      end
    end
  end

  describe "#meta_tags" do
    context "does show all social tags" do
      it{ expect(meta_tags).to have_selector("meta[property='og:description']", visible: false) }
    end
  end
end