class CovidObservation < ApplicationRecord

  def self.get_covid_cases(observation_date:, cases_count:)
    where(observation_date: observation_date)
  end

end
