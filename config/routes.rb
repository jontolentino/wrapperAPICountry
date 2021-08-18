Rails.application.routes.draw do
  # name,population and demonym
  get '/:name' => 'country#show', as: 'country_show'

  # countries that start with that letter
  get '/start/:name' => 'country#starts_with', as: 'country_starts_with'

  # capital of the country
  get ':name/cap' => 'country#capital', as: 'country_capital'

  # ocation of the country
  get ':name/loc' => 'country#location', as: 'country_location'

  # data of the currencies of the country
  get ':name/money' => 'country#money', as: 'country_money'

  # flag of the country
  get ':name/flag' => 'country#flag', as: 'country_flag'

  # countries with less this population
  get 'pop/:nums' => 'country#nums', as: 'country_nums'

end
