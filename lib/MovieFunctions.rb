require "net/http"
require "uri"
require "json"

class MovieFunctions
  
  def self.searchAPI(title, year) 
    apiKey = "eb214d12" 
    url = URI("http://www.omdbapi.com/?apikey=#{apiKey}&t=#{URI.encode_www_form_component(title)}&y=#{URI.encode_www_form_component(year)}")
    response = Net::HTTP.get(url) 
    JSON.parse(response) 
  rescue => e 
    { error: "Failed to fetch movie info", details: e.message } 
  end

  def self.picker()
  #Picks a movie from the list to watch
  end

end
