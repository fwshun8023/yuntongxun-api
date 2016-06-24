module YunTongXun
  class Service

    # 子账号调用接口时需传入子账号信息
    def initialize(sub_account_sid = nil, sub_auth_token = nil, version = "2013-12-26")
      @sub_account_sid = sub_account_sid
      @sub_auth_token = sub_auth_token
      @version = version
    end

    def get_response(header, data, path)
      uri = URI(base_url + path)

      http = Net::HTTP.new(uri.host, uri.port)

      http.use_ssl = true

      request = Net::HTTP::Post.new(base_url + path, header)
      
      request.body = data.to_json

      response = http.request(request)

      result response.body
    end

    # account_sid: 主账号或子账号
    def sign(account_sid, auth_token)
      Digest::MD5.hexdigest(account_sid + auth_token + YunTongXun::Utils.timestamp).upcase
    end

    # account_sid: 主账号或子账号
    def headers(account_sid)
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json;charset=utf-8',
        'Authorization' => Base64.strict_encode64(account_sid + ':' + YunTongXun::Utils.timestamp)
      }
    end

    def base_url
      YunTongXun.base_url || "https://app.cloopen.com:8883"
    end


    private 
      def result body
        begin
          JSON.parse body
        rescue => e
          {
            code: 502,
            msg: "内容解析错误",
            detail: e.to_s
          }
        end
      end

  end
end