class CountryController < ApplicationController
    before_action :country_new

    def show
        @c = @country.country_show(params[:name])

        respond_to do |format|
            format.html { @c }
            format.json { render json: @c }
        end
    end

    def starts_with
        country = Countries::V1::Client.new()
        @c = @country.country_starts_with(params[:letter])

        respond_to do |format|
            format.html { @c }
            format.json { render json: @c }
        end
    end

    def capital
        @c = @country.country_capital(params[:name])

        respond_to do |format|
            format.html { @c }
            format.json { render json: @c }
        end
    end

    def location
        @c = @country.country_location(params[:name])
        @loc = @c.to_json

        respond_to do |format|
            format.html { @loc }
            format.json { render json: @loc }
        end
    end

    def money
        @c = @country.country_money(params[:name])

        respond_to do |format|
            format.html { @c }
            format.json { render json: @c }
        end
    end

    def flag
        @c = @country.country_flag(params[:name])

        respond_to do |format|
            format.html { @c }
            format.json { render json: @c }
        end
    end

    def nums
        @c = @country.country_nums_less(params[:nums].to_i)

        respond_to do |format|
            format.html { @c }
            format.json { render json: @c }
        end
    end

    private

    def country_new
        @country = Countries::V1::Client.new()

    end

end