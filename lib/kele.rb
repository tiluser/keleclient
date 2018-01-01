require 'httparty'

class Kele
 
    include HTTParty
    
    def initialize(u, p)
        @client = { username: u, password: p }
        @base_url = "https://www.bloc.io/api/v1"
        
        info = {
            body: {
                username: u,
                password: p
            }
        }
        
        self.class.post("https://www.bloc.io/api/v1/sessions", info)
    end

end