# rails g controller teams --no-helper --no-assets

class TeamsController < ApplicationController
    before_action :find_team, only:[:show,:edit, :update]
    # before_action :find_datas, only:[:index]

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
        team_data = get_teams
        @teams = team_data["teams"]
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


    private

    # def find_team
    #     @team=Team.find params[:id]
    # end

    def find_datas
        get_teams
    end

    def team_params
        params.require(:team).permit(:name, :home_town, :formed,:active)
    end
   


end
