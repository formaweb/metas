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

  describe "#get_meta" do
    context "passed in args" do
      it{ expect(get_meta("og:description")).to eq("Test") }
      it{ expect(get_meta("twitter:card")).to eq("summary") }
    end
  end
end