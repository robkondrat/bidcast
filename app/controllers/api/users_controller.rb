class Api::UsersController < ApplicationController

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
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end

  end

end
