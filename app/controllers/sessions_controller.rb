class SessionsController < ApplicationController
  def create
    #find_by 引数にマッチするものを一つ取得するもの
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      render 'home/index'
    end
  end

  def destory
    sesstion.delete(:user_id)
    redirect_to root_path
  end
end
