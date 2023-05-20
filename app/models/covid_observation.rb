class CovidObservation < ApplicationRecord

  def self.get_covid_cases(observation_date:, cases_count:)
    observation_date_cases = where(observation_date: observation_date)
    covid_cases = self.combine_covid_cases(covid_cases: observation_date_cases)
    covid_cases = cases_count == "0" ? [] : covid_cases[0..(cases_count.to_i - 1)]

    return covid_cases
  end

  private

    def self.combine_covid_cases(covid_cases:)
      new_cases = Array.new
      if covid_cases
        covid_cases.each do |covid_case|
          new_case = new_cases.select{|n| n[:country] == covid_case.country}.first

          if new_case.present?
            new_case[:recovered] += covid_case.recovered.to_i
            new_case[:deaths] += covid_case.deaths.to_i
            new_case[:confirmed] += covid_case.confirmed.to_i
          elsif covid_case.present?
            new_cases.push({ country: covid_case.country, confirmed: covid_case.confirmed.to_i,
                              deaths: covid_case.deaths.to_i, recovered: covid_case.recovered.to_i })
          end
        end

        new_cases = new_cases.sort_by{|new_case| new_case[:confirmed]}.reverse!
      end

      return new_cases
    end


end
