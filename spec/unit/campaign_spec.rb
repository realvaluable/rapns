require 'unit_spec_helper'

describe Rapns::Apns::Campaign do
  let(:campaign) { described_class.create attributes  }
  let(:attributes) { { :name => 'Lorem', :app_id => 1, :url => 'betatable://issues/1146', :action_type_ids => [1, 2] } }

  it { campaign.should be_valid }

  describe '#data' do
    subject { campaign.data }

    it { should be_kind_of Hash }
    it { should eql({ 'url' => attributes[:url] }) }

    context 'when url is cleared' do
      before do
        @campaign = campaign
        @campaign.url = ''
        @campaign.save
      end

      it 'should be empty' do
        @campaign.data.should eql({})
      end
    end
  end

  describe '#url' do
    subject { campaign.url }

    it { should eql attributes[:url] }

    context 'when url is empty' do
      let(:attributes) { { :name => 'Lorem', :app_id => 1 } }

      it { should_not be_present }
    end
  end
end
