class CountryController < ApplicationController
    before_action :country_new

    def show
        @c = @country.country_show(params[:name])
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
    end

    def flag
    end

    def nums
    end

    private

    def country_new
        @country = Countries::V1::Client.new()
    end

end