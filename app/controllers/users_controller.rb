# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  def index
    filtered = User.where('user_name LIKE ?', "%#{params[:filter]}%").order(user_name: :asc)
    @pagy, @users = pagy(filtered.all, items: 10)
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def search
    filtered = User.where('user_name ILIKE ?', "%#{params[:filter_user]}%").order(user_name: :asc)
    @pagy, @users = pagy(filtered.all, items: 10)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('search_results', partial: 'users/search_results', locals: { users: @users })
      end
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        # format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end
end

private

# Use callbacks to share common setup or constraints between actions.
def set_user
  @user = User.find(params[:id])
end

# Only allow a list of trusted parameters through.
def user_params
  params.require(:user).permit(:user_name, :is_active, :user_type, :email, :password, :salt, :encrypted_password)
end
