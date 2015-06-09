require "etsiest/version"
require "sinatra/base"
require "pry"
require 'etsy'


  Etsy.api_key = ENV['ETSY_KEY']


module Etsiest
  class Search < Sinatra::Base
    get '/' do
      @result = Etsy::Request.get('/listings/active',:includes => ['Images', 'Shop'],:keywords => 'whiskey')
      # binding.pry
      erb :index
    end


    run! if app_file == $0
  end
end
