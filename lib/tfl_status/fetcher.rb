require "json"
require "net/http"
require "uri"
require "htmlentities"

module TflStatus
  BaseUrl = "http://api.tubeupdates.com"

  class Fetcher
    def retrieve(*lines)
      uri = build_uri(lines)
      response_body = make_request(uri)
      # For some reason the API HTML special characters encoded as entities.. but this is JSON :/
      response_body = HTMLEntities.new.decode(response_body)
      JSON.parse(response_body)["response"]
    end

    def build_uri(lines)
      URI.parse("#{BaseUrl}/?method=get.status&lines=#{lines.join(",")}&format=json")
    end

    def make_request(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      raise "Failed to fetch statuses from API" unless response.code.to_i == 200

      response.body
    end
  end
end
