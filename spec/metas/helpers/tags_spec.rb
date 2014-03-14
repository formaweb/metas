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
    context "doesn't generate attr when it's nil or false" do
      it{ expect(meta_tags).to_not have_selector("meta[name='twitter:title']", visible: false) }
      it{ expect(meta_tags).to_not have_selector("meta[name='twitter:domain']", visible: false) }
      it{ expect(meta_tags).to have_selector("meta[property='og:title']", visible: false) }
    end
    context "generate many tags when it's a Array" do
      it{ expect(meta_tags).to have_selector("meta[property='article:tag'][content='test']", visible: false) }
      it{ expect(meta_tags).to have_selector("meta[property='article:tag'][content='other']", visible: false) }
    end
  end

  describe "#get_meta" do
    context "passed in args" do
      it{ expect(get_meta("og:description")).to eq("Test") }
      it{ expect(get_meta("twitter:card")).to eq("summary") }
    end
  end
end