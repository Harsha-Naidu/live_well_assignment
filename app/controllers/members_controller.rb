# rails g controller members --no-helper --no-assets

class MembersController < ApplicationController
    before_action :find_member, only:[:show,:edit, :update,:destroy]
    before_action :get_default, only: [:index]

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
        @q = Member.ransack(params[:q])
        @members = @q.result
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
        get_default
        redirect_to members_path
    end

    private


    def find_member
        @member=Member.find params[:id]
    end

    def member_params
        params.require(:member).permit(:name, :age, :secret_identity,:powers,:team_id)
    end
   

end
