class ApplicationController < ActionController::Base

    def response_api(url)
        response = Excon.get(url)
        JSON.parse(response.body)
    end

    def get_teams
        # members = [];
        # result=[];
        response_api(
            "https://71119a58-557b-497b-9bb2-9971014d44ec.mock.pstmn.io/teams"
         )
        #         response["teams"].each do |team|
        #             t = Team.new(name:team["name"], home_town:team["home_Town"], formed:team["formed"], active:team["active"]);
        #             t.save;
    
        #             team["members"].each do |hero|
        #                 h = Member.new(name:hero["name"], age:hero["age"],secret_identity:hero["secretIdentity"],powers:hero["powers"]);
        #                 h.save;
        #           end
        #         end     
    end 

end
