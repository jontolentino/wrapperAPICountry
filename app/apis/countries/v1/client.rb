module Countries
    module V1
        class Client
            include HttpStatusCodes
            include ApiExceptions
 
            API_ENDPOINT = 'https://restcountries.eu/rest/v2'
            
 
            def initialize(oauth_token = nil)
                @oauth_token = oauth_token
            end
 
            def country_show(country_name)
                request(
                    http_method: :get,
                    endpoint: "name/#{country_name}/")
            end
 
            # def my_repo
            #     request(
            # http_method: :get,
            # endpoint: "user"
            # )
            # end
 
            private
 
            def request(http_method:, endpoint:, params: {})
                @response = connection.public_send(http_method, endpoint, params)
                parsed_response = JSON.parse(@response.body)
 
                return parsed_response if response_successful?
 
                raise error_class, "Code: #{@response.status}, response: #{@response.body}"
            end
 
            def connection
                @connection ||= Faraday.new(API_ENDPOINT) do |f|
                    f.request :url_encoded
                    f.adapter Faraday.default_adapter
                end
            end
 
            def response_successful?
                @response.status == HTTP_OK_CODE
            end
 
            def error_class
                case @response.status
                when HTTP_NOT_FOUND_CODE
                    NotFoundError
                when HTTP_UNPROCESSABLE_ENTITY_CODE
          UnprocessableEntityError
        else
            ApiError
        end
            end
        end
    end
end