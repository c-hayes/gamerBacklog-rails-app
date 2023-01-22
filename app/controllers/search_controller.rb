
class SearchController < ApplicationController
    require 'apicalypse'
    require "uri"
    require "net/http"
    require "json"
   

    def get_token
      
        url = URI("https://id.twitch.tv/oauth2/token?client_id=#{ENV[client_id]}&client_secret=msuaa3xewcx6reciud88dwqu1kvp3x&grant_type=client_credentials")
      
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
      
        request = Net::HTTP::Post.new(url)
      
        response = https.request(request)
        igdb_token = JSON.parse(response.body)['access_token']
        @@igdb_token= igdb_token
    end


    
         
    def get_search
   
        url = URI("https://api.igdb.com/v4/games/")
        
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
        
        request = Net::HTTP::Post.new(url)
        request["Client-ID"] = "lhfcfvbudj94sfv6171yzgn52mywub"
        request["Authorization"] = "Bearer 3gavt6s2f0iwtf6hkbsem7ue7l68dl" 
        request["Content-Type"] = "text/plain"
        request.body = "fields name, artworks, screenshots, genres, summary, platforms, release_dates; search \"#{:gamequery}\"; limit 50;"
        
        response = https.request(request)
        @game = JSON.parse(response.body)
        redirect_to search_path
    end
   

end
