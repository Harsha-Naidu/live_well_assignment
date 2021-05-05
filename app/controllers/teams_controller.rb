# rails g controller teams --no-helper --no-assets

class TeamsController < ApplicationController
    before_action :find_team, only:[:show,:edit, :update,:destroy]
    before_action :get_teams, only: [:index]

    def new
        @team = Team.new
    end

    def create
        @team=Team.new team_params
        
        if @team.save
            flash[:notice]="Team created successfully."
            redirect_to teams_path # index page   
        else
            render :new
        end
    end

    def edit

    end

    def index
        # team_data = get_teams
        # @teams = team_data["teams"]
        # @team_count = @teams.count
        tm_count = team_member_count
        tm_count["teams"].each do |team|
            @count = team["members"].count;
        end
        
        @teams = Team.all
        @team_count = @teams.count
    end

    def show

    end

    def update
        if @team.update team_params
            flash[:notice]="Team edited successfully."
            redirect_to team_path(@team.id)
        else
            render :edit
        end
    end

    def destroy 
        @team.destroy
        redirect_to teams_path
    end

    def delete
        teams = Team.all
        teams.destroy_all
        get_teams
        redirect_to teams_path
    end

    private

    def find_team
        @team=Team.find params[:id]
    end

    def team_params
        params.require(:team).permit(:name, :home_town, :formed,:active)
    end
   
end
