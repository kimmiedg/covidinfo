class Top::CovidObservationsController < ApplicationController

  def confirmed
    if is_valid_date_format(params[:observation_date]) && params[:max_results].present?
      @covid_observations = CovidObservation.get_covid_cases(observation_date: params[:observation_date], cases_count: params[:max_results])
      render json: JSON.neat_generate({observation_date: params[:observation_date], countries: @covid_observations}, wrap: 40)
    else
      render json: "Invalid Paramaters."
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
