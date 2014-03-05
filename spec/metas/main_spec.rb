require 'spec_helper'

describe Metas::Main do
  let(:controller){ double("controller", default_meta_tags: DummyController.new.default_meta_tags) }

  subject{ Metas::Main.new(controller) }

  describe "#default_values" do
    context 'show just values for all social metas' do
      it{ expect(subject.default_values).to include(description: "Test") }
    end
    context 'dont show values for social tags' do
      it{ expect(subject.default_values).to_not have_key(:og) }
    end
  end

  describe "#normalize" do
    context 'hashes for social' do
      it{ expect(subject.normalize).to have_key(:og) }
      it{ expect(subject.normalize).to have_key(:twitter) }
    end
    context 'without params for all social tags' do
      it{ expect(subject.normalize).to_not have_key(:description)  }
    end
  end
end