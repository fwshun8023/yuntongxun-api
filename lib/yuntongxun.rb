require 'openssl'
require 'json'
require 'digest'
require 'base64'
require 'net/http'
require 'net/https'
require 'yuntongxun/version'
require 'yuntongxun/utils'
require 'yuntongxun/service'
require 'yuntongxun/service/calls'

module YunTongXun
  class << self
    attr_accessor :account_sid, :auth_token, :base_url
  end
end