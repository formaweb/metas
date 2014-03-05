require 'spec_helper'

describe Metas::Controller::ChangeMetaTags::InstanceMethods do
  include Metas::Controller::ChangeMetaTags::InstanceMethods

  describe "#change_meta_tags" do
    context 'without call change_metas' do
      subject{ DumbController.new }

      it{ expect(subject.default_meta_tags).to include({ description: "Test" }) }
    end
    context 'create default_meta_tags method' do
      subject{ DumbController.new }
      before{ subject.change_metas }

      it{ expect(subject.default_meta_tags[:og]).to include({ description: "another test" }) }
      it{ expect(subject.default_meta_tags[:og]).to_not include({ description: "Test" }) }
    end
  end
end