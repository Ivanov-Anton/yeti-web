# frozen_string_literal: true

RSpec.describe System::NetworkPrefix, type: :model do
  describe '#validate_prefix_uniqueness' do
    subject { network_prefix.errors.messages }

    let(:network_prefix_attrs) { { prefix: '9', number_min_length: 1, number_max_length: 1 } }

    context 'when no conflicting prefixes exist' do
      let(:network_prefix) { FactoryBot.build(:network_prefix, prefix: '1', number_min_length: 12) }

      before do
        FactoryBot.create(:network_prefix, network_prefix_attrs)
        network_prefix.valid?
      end

      it 'does not add any validation errors' do
        expect(subject[:number_max_length]).to eq []
        expect(subject[:number_min_length]).to eq []
        expect(subject[:prefix]).to eq []
      end
    end

    context 'when conflicting prefixes exist' do
      let(:network_prefix) { FactoryBot.build(:network_prefix, network_prefix_attrs) }

      before do
        FactoryBot.create(:network_prefix, network_prefix_attrs)
        network_prefix.valid?
      end

      it 'adds errors for prefix, number_max_length, and number_min_length' do
        expect(subject[:prefix]).to contain_exactly('has already been taken')
        expect(subject[:number_max_length]).to contain_exactly('length with 9 prefix already taken')
        expect(subject[:number_min_length]).to contain_exactly('length with 9 prefix already taken')
      end
    end

    context 'when create network_prefix with "prefix" = nil' do
      subject { network_prefix.valid? }

      let(:network_prefix) { FactoryBot.build(:network_prefix, prefix: nil) }

      it 'should not execute validation' do
        expect(network_prefix).not_to receive(:validate_prefix_uniqueness)
        subject
      end
    end

    context 'when update record and there is conflicting record' do
      subject { record.update(prefix: '2') }

      let!(:record) { FactoryBot.create(:network_prefix, prefix: '1') }

      before { FactoryBot.create(:network_prefix, prefix: '2') }

      it 'should add error validation' do
        subject

        expect(record.errors[:prefix]).to contain_exactly('has already been taken')
        expect(record.errors[:number_max_length]).to contain_exactly('length with 2 prefix already taken')
        expect(record.errors[:number_min_length]).to contain_exactly('length with 2 prefix already taken')
      end
    end
  end

  describe 'network_prefixes_prefix_key' do
    subject { network_prefix.save!(validate: false) }

    let(:network_prefix) { FactoryBot.build(:network_prefix, prefix: '1') }

    before { FactoryBot.create(:network_prefix, prefix: '1') }

    it 'should raise PG error with "network_prefixes_prefix_key" index' do
      expect { subject }.to raise_error(ActiveRecord::RecordNotUnique).with_message(/network_prefixes_prefix_key/)
    end
  end
end