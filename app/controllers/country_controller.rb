class CountryController < ApplicationController
    before_action :country_new

    def show
        @c = @country.country_show(params[:name])

        respond_to do |format|
            format.html { @c }
            format.json { render json: json_format(@c) }
        end
    end

    def starts_with
        country = Countries::V1::Client.new()
        @c = @country.country_starts_with(params[:letter])
    end

    def capital
        @c = @country.country_capital(params[:name])
    end

    def location
        @c = @country.country_location(params[:name])
        @loc = @c.to_json
    end

    def money
        @c = @country.country_money(params[:name])
    end

    def flag
        @c = @country.country_flag(params[:name])
    end

    def nums
        @c = @country.country_nums_less(params[:nums].to_i)
    end

    private

    def country_new
        @country = Countries::V1::Client.new()
    end

end