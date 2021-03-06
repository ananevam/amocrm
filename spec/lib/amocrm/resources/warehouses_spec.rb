require 'spec_helper'

describe AmoCRM::Resources::Warehouses do

  before do
    stub_rest 'Warehouse'
  end

  describe do
    subject { described_class.new client: client }
    it do
      expect(subject.list.count).to eq 2
    end

    it 'should get list' do
      expect(subject.list.first).to be_a AmoCRM::Entities::Warehouse
    end
  end

end
