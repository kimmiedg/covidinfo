require 'rails_helper'

RSpec.describe CovidObservation, type: :model do

  describe '.get_covid_cases' do
    it "must return array covid cases based on observation date" do
      covid_cases = CovidObservation.get_covid_cases(observation_date: "2020-01-22", cases_count:0)
      expect(covid_cases).to be_an_instance_of(Array)
    end
  end

  describe '.combine_covid_cases' do

    it 'combines COVID cases and returns an array of hashes' do
      covid_cases = CovidObservation.get_covid_cases(observation_date: "2020-01-22", cases_count:0)
      cases = CovidObservation.combine_covid_cases(covid_cases: covid_cases)
      expect(cases).to be_an(Array)

      # check the contents of Hashes
      cases.each do |c|
        expect(c).to be_a(Hash)
        expect(c).to have_key(:country)
        expect(c).to have_key(:confirmed)
        expect(c).to have_key(:deaths)
        expect(c).to have_key(:recovered)
      end
    end
  end

end
