class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_advertiser
    puts '=' * 30
    request.headers["Authorization"]
    puts '=' * 30
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]

      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        Advertiser.find_by(id: decoded_token[0]["user_id"])
      rescue ActiveRecord::RecordNotFound
        nil
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_advertiser

  def current_podcast
    puts '=' * 30
    request.headers["Authorization"]
    puts '=' * 30
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]

      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        Podcast.find_by(id: decoded_token[0]["user_id"])
      rescue ActiveRecord::RecordNotFound
        nil
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_podcast

  def current_user
    puts '=' * 30
    request.headers["Authorization"]
    puts '=' * 30
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]

      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue ActiveRecord::RecordNotFound
        nil
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_user

  def authenticate_advertiser
    unless current_advertiser
      render json: {}, status: :unauthorized
    end
  end

  def authenticate_podcast
    unless current_podcast
      render json: {}, status: :unauthorized
    end
  end

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end
end