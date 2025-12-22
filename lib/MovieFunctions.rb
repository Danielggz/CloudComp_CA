require "net/http"
require "uri"
require "json"

class MovieFunctions
  
  def self.searchAPI(title, year) 
    #Search movie by title and year (optional)
    apiKey = "eb214d12" 
    url = URI("http://www.omdbapi.com/?apikey=#{apiKey}&t=#{URI.encode_www_form_component(title)}&y=#{URI.encode_www_form_component(year)}")
    response = Net::HTTP.get(url) 
    JSON.parse(response) 
  rescue => e 
    { error: "Failed to fetch movie info", details: e.message } 
  end

  def self.picker()
    #Picks a movie from the list to watch
    picked = Movie.order("RANDOM()").first

    apiKey = "eb214d12" 
    url = URI("http://www.omdbapi.com/?apikey=#{apiKey}&t=#{URI.encode_www_form_component(picked.title)}&y=#{URI.encode_www_form_component(picked.year)}")

    response = Net::HTTP.get(url)
    data = JSON.parse(response)

    if data["Response"] == "False"
      return {
        source: "local", 
        data: { 
          id: picked.id, title: picked.title, year: picked.year, duration: picked.duration, director: picked.director 
        }
      }
    else
      return {
        source: "omdb",
        data: data
      }
    end

  end

end
