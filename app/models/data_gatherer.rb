require "net/http"
require "uri"
require "json"
require 'rake'
class DataGatherer

  def request_data
    uri = URI.parse("https://api.shapeways.com/")

    response = Net::HTTP.get_response(uri)

    JSON.parse(response.body)['Deeper']['controllers']
  end

  def fetch
    request_data.collect do |item|
      {:title => item['title'], :description => item['description']}
    end
  end

  def run
    fetch.each do |home|
      Home.create(title: home[:title], description: home[:description])
    end
  end
end