class SessionsController < ApplicationController
  def new
  end

  def create
    @employee = Employee.find_by(email: params[:user][:email].downcase)
    if @employee
      if @employee.authenticate(params[:user][:password])
        reset_session
        session[:current_user_id] = @employee.id
        redirect_to dashboard_index_path, notice: "Signed in."
      else
        flash.now[:alert] = "Incorrect email or password."
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "Incorrect email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end