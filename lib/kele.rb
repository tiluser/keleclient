require 'httparty'
require 'json'

class Kele
 
    include HTTParty
    
    def initialize(u, p)
        @client = { username: u, password: p }
        @base_url = 'https://www.bloc.io/api/v1'
        # https://www.bloc.io/api/v1/users/me
        
        info = {
            body: {
                username: u,
                password: p,
                email: u
            }
        }
        
        @auth_token = self.class.post("https://www.bloc.io/api/v1/sessions", info)
    end
    
    def get_me
       # Commented out portion does not work. 
       response = self.class.get(@base_url, headers: { "Authorization" => @auth_token })
    #   response = self.class.get(@base_url, { "authorization" => @auth_token })
       JSON.parse response.body
    end

end