require 'fuzzy.ai/version'
require 'httparty'
require 'json'

module FuzzyAi
  # Fuzzy.ai Account object
  class Account
    include HTTParty
    base_uri 'https://api.fuzzy.ai'

    attr_reader :key

    def initialize(key)
      @key = key
      @headers = {
        'Content-Type' => 'application/json',
        'Authorization' => 'Bearer ' + key,
        'User-Agent' => "fuzzy.ai-ruby/#{VERSION}"
      }
    end

    def evaluate(agent_id, inputs)
      body = inputs.to_json
      headers = @headers.merge('Content-Length' => body.length.to_s)
      options = { headers: headers, body: body }

      response = self.class.post("/agent/#{agent_id}", options)
      id = response.headers['X-Evaluation-ID']
      [response, id]
    end

    def feedback(evaluation_id, performance)
      body = performance.to_json
      headers = @headers.merge('Content-Length' => body.length.to_s)
      options = { headers: headers, body: body }

      self.class.post("/evaluation/#{evaluation_id}/feedback", options)
    end
  end
end
