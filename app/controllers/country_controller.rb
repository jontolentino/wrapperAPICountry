class CountryController < ApplicationController

    def show
        country = Countries::V1::Client.new()
        @c = country.country_show(params[:name])
    end

    def starts_with
    end

    def capital
    end

    def location
    end

    def money
    end

    def flag
    end

    def nums
    end

end