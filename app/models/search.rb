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


def search_igdb
    response = RestClient.get("https://api.igdb.com/v4/games", {
        Authorization: "Bearer #{session[:igdb_token]}",
        headers: {
            "Client-ID" => ENV["CLIENT_ID"],
            "Accept" => "application/json",
            "Content-Type" => "application/json"
        },
        params: {
            "search" => "mario",
            "fields" => "name,platforms,genres,cover.url"
        }
        })
end