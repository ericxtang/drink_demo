require 'sinatra'
require 'httparty'
require 'json'
require 'ruby-debug'
require 'cgi'

get '/basketball' do
  @client_id = "AkZY9IUh4YwsyW4XlKEWq0XhU6ornBtEeAGkyRlx"
  @client_secret = "yy9xtwpWAbDZoVcIB8pzeO6vWuNk75wvFI5ibUyA"
  @address = "915 Broadway, New York"
  @tags = ["basketball"]
  response = HTTParty.get("https://api.hyperpublic.com/api/v1/people?client_id=#{@client_id}&client_secret=#{@client_secret}&address=#{CGI::escape(@address)}&tags=#{@tags.join(",")}&limit=11")
  @objects = JSON.parse(response.body)
  haml :people, :format => :html5
end

get '/burgers' do
  @client_id = "AkZY9IUh4YwsyW4XlKEWq0XhU6ornBtEeAGkyRlx"
  @client_secret = "yy9xtwpWAbDZoVcIB8pzeO6vWuNk75wvFI5ibUyA"
  @address = "915 Broadway, New York"
  @tags = ["burgers"]
  response = HTTParty.get("https://api.hyperpublic.com/api/v1/places?client_id=#{@client_id}&client_secret=#{@client_secret}&address=#{CGI::escape(@address)}&tags=#{@tags.join(",")}&limit=11&with_photo=true")
  @objects = JSON.parse(response.body)
  haml :places, :format => :html5
end


