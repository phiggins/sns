# encoding: utf-8

require 'openssl'
require 'base64'

class Sns
  class AwsCredentials
    attr_reader :access_key, :host
  
    def initialize(access_key, secret_key, region)
      @access_key, @secret_key = access_key, secret_key
      @host = "sns.#{region}.amazonaws.com"
    end
  
    def sign(query_string, path='/', method='GET')
      digest = OpenSSL::HMAC.new(@secret_key, OpenSSL::Digest::SHA256.new)
      digest.update([method, @host, path, query_string].join("\n"))

      Base64.encode64(digest.digest).chomp
    end
  end
end
