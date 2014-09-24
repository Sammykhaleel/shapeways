
require "net/http"
require "uri"
require "json"
class Home < ActiveRecord::Base
  serialize :title
  serialize :description



      uri = URI.parse("https://api.shapeways.com/")

      @response = Net::HTTP.get_response(uri)

      @data = JSON.parse(@response.body)
    
      @output_hash = {}
      @data['Deeper']['controllers'].each do |item|
        @output_hash[:title] = item['title']
        puts @output_hash
      
       end
    
end
  home = Home.new
  home.title = {title: [:Deeper]}
  home.description = {description: ['description']}
  home.save
 


