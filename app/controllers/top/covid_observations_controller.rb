class Top::CovidObservationsController < ApplicationController

  def confirmed
    if params[:observation_date].present? && is_valid_date_format(params[:observation_date])
      @covid_observations = CovidObservation.get_covid_cases(observation_date: params[:observation_date], cases_count: 2)
      c = {observation_date: params[:observation_date], countries: @covid_observations.map{|c| {country: c.country, confirmed: c.confirmed, deaths: c.deaths, recovered: c.recovered}}}
      render json: JSON.neat_generate(c, wrap: 40)
    else
      render json: "Invalid Date Parameters"
    end
  end

  private

    def is_valid_date_format(obj)
      begin
        date = Date.strptime(obj, '%Y-%m-%d')
        return true
      rescue
        return false
      end
    end
end
