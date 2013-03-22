require 'unit_spec_helper'

describe Rapns::Apns::Campaign do
  let(:campaign) { described_class.create attributes  }

  context 'with valid attributes' do
    let(:attributes) { { :name => 'Lorem', :app_id => 1, :url => 'betatable://issues/1146' } }

    it { campaign.should be_valid }

    describe '#data' do
      subject { campaign.data }

      it { should be_kind_of Hash }
      it { should eql({ 'url' => attributes[:url] }) }
    end

    describe '#url' do
      subject { campaign.url }

      it { should eql attributes[:url] }
    end
  end
end
