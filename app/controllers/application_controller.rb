class ApplicationController < ActionController::Base

    def response_api(url)
        response = Excon.get(url)
        JSON.parse(response.body) # To convert JSON data to String of arrays
    end

    def get_teams 
        response = response_api(
            "https://71119a58-557b-497b-9bb2-9971014d44ec.mock.pstmn.io/teams"
         )
        
         if(Team.all.count == 0)  # table should be empty
                response["teams"].each do |team|
                    team_data = Team.new(name:team["name"], home_town:team["homeTown"], formed:team["formed"], active:team["active"])
                    team_data.save() 
                end 
            end          
    end 

    def get_members
        response_data = response_api(
            "https://71119a58-557b-497b-9bb2-9971014d44ec.mock.pstmn.io/teams"
         )
        if(Member.all.count == 0)
            response_data["teams"].each do |team|
                team["members"].each do |hero|
                    hero_data = Member.new(name:hero["name"], age:hero["age"],secret_identity:hero["secretIdentity"],powers:hero["powers"])
                    hero_data.save()
                end
            end
        end
    end

    def team_member_count
        response_api(
            "https://71119a58-557b-497b-9bb2-9971014d44ec.mock.pstmn.io/teams"
         )
    end
end
