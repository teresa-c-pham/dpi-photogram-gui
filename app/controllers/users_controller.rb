class UsersController < ApplicationController
  def index
    @users = User.all.order({ :username => :asc })
    render({ :template => "user_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_user = User.where(:username => the_id).at(0)

    render({ :template => "user_templates/show" })
  end

  def create
    @the_user = User.new
    @the_user.username = params.fetch("query_username")

    if @the_user.valid?
      @the_user.save
      redirect_to("/users/#{@the_user.username}", { :notice => "User created successfully." })
    else
      redirect_to("/users", { :notice => "User failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_user = User.where(:username => the_id).at(0)

    @the_user.username = params.fetch("query_username")

    if @the_user.valid?
      @the_user.save
      redirect_to("/users/#{@the_user.username}", { :notice => "User updated successfully."} )
    else
      redirect_to("/users/#{@the_user.username}", { :alert => "User failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_user = User.where(:username => the_id).at(0)

    @the_user.destroy

    redirect_to("/users", { :notice => "User deleted successfully."} )
  end
end
