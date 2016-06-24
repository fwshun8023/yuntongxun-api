module YunTongXun
  class Calls < Service
    CALLBACK = "/Calls/Callback"

    def callback(options = {})
      header = headers(@sub_account_sid)
      sig = sign(@sub_account_sid, @sub_auth_token)
      path = "/#{@version}/SubAccounts/#{@sub_account_sid}/Calls/Callback?sig=#{sig}"
      get_response(header, options, path)
    end

  end
end
