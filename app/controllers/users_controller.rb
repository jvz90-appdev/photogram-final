class UsersController < ApplicationController
  def index
    @users = User.all.order({ :username => :asc })

    render({ :template => "users/index.html" })
  end

  def show
    the_username = params.fetch("the_username")
    @user = User.where({ :username => the_username }).at(0)
    if @user.private == true
    redirect_to("/users", { :alert => "You're not authorized for that." })
    else
    render({ :template => "users/show.html.erb" })
    end
  end

  def feedpage
    the_username = params.fetch("the_username")
    @user = User.where({ :username => the_username }).at(0)

    render({ :template => "users/feedpage.html.erb" })
  end

  def likedphotos
    the_username = params.fetch("the_username")
    @user = User.where({ :username => the_username }).at(0)

    render({ :template => "users/likedphotos.html.erb" })
  end


end