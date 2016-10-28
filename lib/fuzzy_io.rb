require 'fuzzy_io/version'
require 'net/http'
require 'json'

API_ROOT = "https://api.fuzzy.ai"

module FuzzyIo

  class Account

    attr_reader :key

    def initialize(key)
      @key = key
    end

    def evaluate(agent_id, inputs)
      uri = URI(API_ROOT + "/agent/" + agent_id)
      body = inputs.to_json
      headers = {
        'Content-Type' => 'application/json',
        'Authorization' => 'Bearer ' + @key,
        'Content-Length' => body.length.to_s
      }
      req = Net::HTTP::Post.new(uri, initheader = headers)
      req.body = body
      http = Net::HTTP.start(uri.hostname, uri.port, opt={use_ssl: (uri.scheme == "https")})
      res = http.request(req)
      if res.is_a?(Net::HTTPSuccess)
        id = res['X-Evaluation-ID']
        outputs = JSON.parse res.body
        return outputs, id
      else
        raise res
      end
    end

    def feedback(evaluation_id, performance)
      uri = URI(API_ROOT + "/evaluation/" + evaluation_id + "/feedback")
      body = performance.to_json
      headers = {
        'Content-Type' => 'application/json',
        'Authorization' => 'Bearer ' + @key,
        'Content-Length' => body.length.to_s
      }
      req = Net::HTTP::Post.new(uri, initheader = headers)
      req.body = body
      http = Net::HTTP.start(uri.hostname, uri.port, opt={use_ssl: (uri.scheme == "https")})
      res = http.request(req)
      if res.is_a?(Net::HTTPSuccess)
        fb = JSON.parse res.body
        return fb
      else
        raise res
      end
    end

  end

end
