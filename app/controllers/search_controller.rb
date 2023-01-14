
class SearchController < ApplicationController
  
    def get_token
        require "uri"
        require "net/http"
        require "JSON"
      
        url = URI("https://id.twitch.tv/oauth2/token?client_id=lhfcfvbudj94sfv6171yzgn52mywub&client_secret=msuaa3xewcx6reciud88dwqu1kvp3x&grant_type=client_credentials")
      
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
      
        request = Net::HTTP::Post.new(url)
      
        response = https.request(request)
        igdb_token = JSON.parse(response.body)['access_token']
        
    end



    def get_search_results
        get_token
        api_endpoint = 'https://api.igdb.com/v4/games'
        request_headers = { headers: { 'client-id' => ENV["CLIENT_ID"], 'authorization' => 'Bearer igdb_token', 'x-user-agent' => 'ruby-apicalypse' } }

        api = Apicalypse.new(api_endpoint, request_headers)

        api
        .fields(:name, :total_rating)
        .where(category: 1)
        .search('Call of Duty')
        .limit(2)
        .request
    end
end
