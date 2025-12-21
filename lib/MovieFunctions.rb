require "net/http"
require "uri"
require "json"

class MovieFunctions
  
  def self.searchAPI(title) 
    url = URI("https://imdb.iamidiotareyoutoo.com/search?q=#{URI.encode_www_form_component(title)}&tt=&lsn=1&v=1") 
    response = Net::HTTP.get(url) 
    JSON.parse(response) 
  rescue => e 
    { error: "Failed to fetch movie info", details: e.message } 
  end

  def self.picker()
  #Picks a movie from the list to watch
  end

end
