class ApplicationController < ActionController::Base

    def response_api(url)
        response = Excon.get(url)
        JSON.parse(response.body) # To convert JSON data to String of arrays
    end

    

    # store the teams and members at the same time
    def get_default
        if(Team.all.count == 0 || Member.all.count == 0)
            response = response_api(
                "https://71119a58-557b-497b-9bb2-9971014d44ec.mock.pstmn.io/teams"
            )

            response["teams"].each do |team_info|
                # Create the team
                team = Team.find_or_create_by(
                    name:team_info["name"], 
                    home_town:team_info["homeTown"], 
                    formed:team_info["formed"], 
                    active:team_info["active"]
                )

                # Create the members of this team
                team_info["members"].each do |hero|
                    team.members.find_or_create_by(
                        name:hero["name"],
                        age:hero["age"],
                        secret_identity:hero["secretIdentity"],
                        powers:hero["powers"]
                    )
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

=begin
{
  "teams": [
    {
      "name": "Eronators",
      "homeTown": "Metro City",
      "formed": 2016,
      "active": true,
      "members": [
        {
          "name": "Molecule Man",
          "age": 29,
          "secretIdentity": "Dan Jukes",
          "powers": "Radiation resistance, Turning tiny, Radiation blast"
        },
        {
          "name": "Madame Uppercut",
          "age": 39,
          "secretIdentity": "Jane Wilson",
          "powers": "Million tonne punch, Damage resistance, Superhuman reflexes"
        }
      ]
    },
    {
      "name": "Tyradians",
      "homeTown": "Liverbial",
      "formed": 2018,
      "active": true,
      "members": [
        {
          "name": "Stanley Yelnats",
          "age": 39,
          "secretIdentity": "Tableau",
          "powers": "Super speed, Lightening punch"
        },
        {
          "name": "Eternal Flame",
          "age": 1000000,
          "secretIdentity": "Unknown",
          "powers": "Immortality, Heat Immunity, Inferno, Teleportation, Interdimensional travel"
        }
      ]
    }
  ]
}
=end