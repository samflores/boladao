require 'rails_helper'

RSpec.describe Team, type: :model do
  it 'requires name to be present' do
    team = Team.new(name: nil, short_name: 'BRA')

    expect(team).to_not be_valid
    expect(team.errors[:name]).to include("can't be blank")
  end

  it 'requires name to be filled' do
    team = Team.new(name: '', short_name: 'BRA')

    expect(team).to_not be_valid
    expect(team.errors[:name]).to include("can't be blank")
  end

  it 'requires name to be unique' do
    Team.create(name: 'Brazil', short_name: 'BRA')

    team = Team.new(name: 'Brazil', short_name: 'BRL')

    expect(team).to_not be_valid
    expect(team.errors[:name]).to include('has already been taken')
  end

  it 'requires short name to be present' do
    team = Team.new(name: 'Brazil', short_name: nil)

    expect(team).to_not be_valid
    expect(team.errors[:short_name]).to include("can't be blank")
  end

  it 'requires short name to be filled' do
    team = Team.new(name: 'Brazil', short_name: '')

    expect(team).to_not be_valid
    expect(team.errors[:short_name]).to include("can't be blank")
  end

  it 'requires short name to be unique' do
    Team.create(name: 'Brazil', short_name: 'BRA')

    team = Team.new(name: 'Brasil', short_name: 'BRA')

    expect(team).to_not be_valid
    expect(team.errors[:short_name]).to include('has already been taken')
  end

  it 'requires short name to have 3 characters' do
    team = Team.new(name: 'Brazil', short_name: 'BRAZIL')

    expect(team).to_not be_valid
    expect(team.errors[:short_name]).to include('is the wrong length (should be 3 characters)')
  end
end
