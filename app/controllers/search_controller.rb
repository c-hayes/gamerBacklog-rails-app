
class SearchController < ApplicationController
    require 'apicalypse'

    def game_title
        @query = :q
    end
   

    def get_token
        require "uri"
        require "net/http"
        require "JSON"
      
        url = URI("https://id.twitch.tv/oauth2/token?client_id=#{ENV[client_id]}&client_secret=msuaa3xewcx6reciud88dwqu1kvp3x&grant_type=client_credentials")
      
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
      
        request = Net::HTTP::Post.new(url)
      
        response = https.request(request)
        igdb_token = JSON.parse(response.body)['access_token']
        @@igdb_token= igdb_token
    end



    def get_search_results
        require "uri"
        require "net/http"
        
        url = URI("https://api.igdb.com/v4/games/")
        
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
        
        request = Net::HTTP::Post.new(url)
        request["Client-ID"] = "lhfcfvbudj94sfv6171yzgn52mywub"
        request["Authorization"] = "Bearer 3gavt6s2f0iwtf6hkbsem7ue7l68dl" 
        request["Content-Type"] = "text/plain"
        request["Cookie"] = "__cf_bm=.OmDGw8dm4xDnJKBLL3dhSqh9H2A.XuVf60JRUdKdIM-1673893584-0-AdKJrbfbI91CKM3E81Cpen8QruOOE29x+MZJNgl/vGdXSuwlsCRmzi5ea4mb0atlZbdvAwV3ggSlvcwX2AdCsTE="
        request.body = "fields name, artworks, screenshots, genres, summary, platforms, release_dates; search \"#{:q}\"; limit 50;"
        
        response = https.request(request)
        puts response.read_body
    end


end
