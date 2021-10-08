require 'net/http'

class GraphQLClient
  def initialize(url)
    @uri = URI(url)
  end

  def perform(query, **variables)
    request = Net::HTTP::Post.new(@uri, 'Content-Type' => 'application/json')
    request.body = { query: query, variables: variables }.to_json

    response = Net::HTTP.start(@uri.hostname, @uri.port) do |http|
      http.request(request)
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
