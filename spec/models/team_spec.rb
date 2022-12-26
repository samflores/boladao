# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team do
  it 'requires name to be present' do
    team = described_class.new(name: nil, short_name: 'BRA')

    expect(team).not_to be_valid
    expect(team.errors[:name]).to include("can't be blank")
  end

  it 'requires name to be filled' do
    team = described_class.new(name: '', short_name: 'BRA')

    expect(team).not_to be_valid
    expect(team.errors[:name]).to include("can't be blank")
  end

  it 'requires name to be unique' do
    described_class.create(name: 'Brazil', short_name: 'BRA')

    team = described_class.new(name: 'Brazil', short_name: 'BRL')

    expect(team).not_to be_valid
    expect(team.errors[:name]).to include('has already been taken')
  end

  it 'requires short name to be present' do
    team = described_class.new(name: 'Brazil', short_name: nil)

    expect(team).not_to be_valid
    expect(team.errors[:short_name]).to include("can't be blank")
  end

  it 'requires short name to be filled' do
    team = described_class.new(name: 'Brazil', short_name: '')

    expect(team).not_to be_valid
    expect(team.errors[:short_name]).to include("can't be blank")
  end

  it 'requires short name to be unique' do
    described_class.create(name: 'Brazil', short_name: 'BRA')

    team = described_class.new(name: 'Brasil', short_name: 'BRA')

    expect(team).not_to be_valid
    expect(team.errors[:short_name]).to include('has already been taken')
  end

  it 'requires short name to have 3 characters' do
    team = described_class.new(name: 'Brazil', short_name: 'BRAZIL')

    expect(team).not_to be_valid
    expect(team.errors[:short_name]).to include('is the wrong length (should be 3 characters)')
  end
end
