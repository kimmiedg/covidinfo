require 'rails_helper'

RSpec.describe CovidObservation, type: :model do

  it "must return array covid cases based on observation date" do
    observation_date = "2020-01-22"
    covid_cases = CovidObservation.get_covid_cases(observation_date: observation_date, cases_count:0)
    expect(covid_cases).to be_an_instance_of(Array)
  end

end
