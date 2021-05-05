# rails g controller members --no-helper --no-assets

class MembersController < ApplicationController
    before_action :find_member, only:[:show,:edit, :update,:destroy]
    before_action :get_members, only: [:index]

    def new
        @member = Member.new
    end
    def create
        @member=Member.new member_params
        
        if @member.save
            flash[:notice]="Member created successfully."
            redirect_to members_path # index page   
        else
            render :new
        end
    end

    def edit

    end

    def index
        @members = Member.all
        @member_count = @members.count
    end

    def show

    end

    def update
        if @member.update member_params
            flash[:notice]="Member edited successfully."
            redirect_to member_path(@member.id)
        else
            render :edit
        end
    end

    def destroy   
        @member.destroy
        redirect_to members_path
    end
   
    def delete
        members = Member.all
        members.destroy_all
        get_members
        redirect_to members_path
    end

    private

    # def get_members
    #     @data =[] 
    #     heroes = get_teams
    #     heroes["teams"].each do |team|
    #         team["members"].map do |hero|
    #         @data.push(hero)
    #         end
    #     end
    #     return @data
    # end

    def find_member
        @member=Member.find params[:id]
    end

    def member_params
        params.require(:member).permit(:name, :age, :secret_identity,:powers)
    end
   

end
