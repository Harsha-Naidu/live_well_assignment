# rails g controller teams --no-helper --no-assets

class TeamsController < ApplicationController
    before_action :find_team, only:[:show,:edit, :update, :destroy]
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
        @teams = Team.all.order(created_at: :desc)
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
    def find_team
        @team=Team.find params[:id]
    end

    def team_params
        params.require(:team).permit(:name, :home_town, :formed,:active)
    end
   


end
