require 'spec_helper'

describe Icms::StateRates do
  it 'has a version number' do
    expect(Icms::VERSION).not_to be nil
  end

  context 'when unknown state' do
    it 'returns nil' do
      expect(Icms::StateRates.new.get_percentual(:ZZ)).to eq(nil)
    end
  end

  context 'when known state' do
    it 'gets percentual from one state' do
      expect(Icms::StateRates.new.get_percentual(:AC)).to eq(17.0)
    end

    it 'gets percentual from two states' do
      expect(Icms::StateRates.new.get_percentual(:AC, :SP)).to eq(12.0)
    end

    it 'gets all informations from two states' do
      result = Icms::StateRates.new.get(:AC, :SP)

      expect(result.source_state).to eq(17.0)
      expect(result.destination_state).to eq(18.0)
      expect(result.between).to eq(12.0)
    end
  end

  context 'when using another table' do
    it 'can use a different table and separator' do
      table = <<-TABLE
        XX|YY
        --
        XX|1|999
        YY|555|2
      TABLE

      separator = '|'

      result = Icms::StateRates.new(table, separator).get(:XX, :YY)

      expect(result.source_state).to eq(1.0)
      expect(result.destination_state).to eq(2.0)
      expect(result.between).to eq(999.0)
    end
  end
end

