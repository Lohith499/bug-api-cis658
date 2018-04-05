class BugsController < ApplicationController
before_action :set_user ,
before_action :set_statuses, :set_issue_types, :set_priorities, :convert_bug_params, :set_user_bug, only: [:show, :update, :destroy]
# GET /users/:user_id/bugs
def index
json_response(@user.bugs)
end
# GET /users/:user_id/bugs/:id
def show
json_response(@bug)
end
def set_statuses
    @statuses = Bug.statuses
  end

  def set_issue_types
    @issue_types = Bug.issue_types
  end

  def set_priorities
    @priorities = Bug.priorities
  end

def convert_bug_params
  params[:priority]=params[:priority].to_i
  params[:issue_type]=params[:issue_type].to_i
  params[:status]=params[:status].to_i
end

# POST /users/:user_id/bugs
def create
@user.bugs.create!(bug_params)
json_response(@user, :created)
end
# PUT /users/:user_id/bugs/:id
def update
@bug.update(bug_params)
head :no_content
end
# DELETE /users/:user_id/bugs/:id
def destroy
@bug.destroy
head :no_content
end
private

def bug_params
params.permit(:title, :description, :issue_type, :priority, :status)
end
def set_user
@user = User.find(params[:user_id])
end

def set_user_bug
@bug = @user.bugs.find_by!(id: params[:id]) if @user
end
end
