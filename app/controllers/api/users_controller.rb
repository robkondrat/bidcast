class Api::UsersController < ApplicationController
  
  def index
    @users = User.all
    render "index.json.jb"
  end

  def create
    @user = User.new(
                    name: params[:name],
                    description: params[:description],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation],
                    type: params[:type]
                    )

    if @user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end

  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @user = User.find(params[:id])

    @user.name = params[:name] || @user.name
    @user.description = params[:description] || @user.description
    @user.email = params[:email] || @user.email

    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    render json: {message: "User ID #{user.id} successfully deleted."}
  end


end
