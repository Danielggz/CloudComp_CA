warning: in the working copy of 'app/controllers/movies_controller.rb', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'app/models/movie.rb', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'config/routes.rb', LF will be replaced by CRLF the next time Git touches it
[1mdiff --git a/app/controllers/users_controller.rb b/app/controllers/users_controller.rb[m
[1mdeleted file mode 100644[m
[1mindex 7c67d46..0000000[m
[1m--- a/app/controllers/users_controller.rb[m
[1m+++ /dev/null[m
[36m@@ -1,51 +0,0 @@[m
[31m-class UsersController < ApplicationController[m
[31m-  before_action :set_user, only: %i[ show update destroy ][m
[31m-[m
[31m-  # GET /users[m
[31m-  def index[m
[31m-    @users = User.all[m
[31m-[m
[31m-    render json: @users[m
[31m-  end[m
[31m-[m
[31m-  # GET /users/1[m
[31m-  def show[m
[31m-    render json: @user[m
[31m-  end[m
[31m-[m
[31m-  # POST /users[m
[31m-  def create[m
[31m-    @user = User.new(user_params)[m
[31m-[m
[31m-    if @user.save[m
[31m-      render json: @user, status: :created, location: @user[m
[31m-    else[m
[31m-      render json: @user.errors, status: :unprocessable_content[m
[31m-    end[m
[31m-  end[m
[31m-[m
[31m-  # PATCH/PUT /users/1[m
[31m-  def update[m
[31m-    if @user.update(user_params)[m
[31m-      render json: @user[m
[31m-    else[m
[31m-      render json: @user.errors, status: :unprocessable_content[m
[31m-    end[m
[31m-  end[m
[31m-[m
[31m-  # DELETE /users/1[m
[31m-  def destroy[m
[31m-    @user.destroy![m
[31m-  end[m
[31m-[m
[31m-  private[m
[31m-    # Use callbacks to share common setup or constraints between actions.[m
[31m-    def set_user[m
[31m-      @user = User.find(params.expect(:id))[m
[31m-    end[m
[31m-[m
[31m-    # Only allow a list of trusted parameters through.[m
[31m-    def user_params[m
[31m-      params.expect(user: [ :username, :password, :name, :lastname ])[m
[31m-    end[m
[31m-end[m
[1mdiff --git a/app/models/user.rb b/app/models/user.rb[m
[1mdeleted file mode 100644[m
[1mindex 2427eab..0000000[m
[1m--- a/app/models/user.rb[m
[1m+++ /dev/null[m
[36m@@ -1,6 +0,0 @@[m
[31m-class User < ApplicationRecord[m
[31m-  validates :username, presence: true[m
[31m-  validates :password, presence: true[m
[31m-  validates :name, presence: true[m
[31m-  validates :lastname, presence: true[m
[31m-end[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex 7163ab7..be4cb5f 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -4,7 +4,6 @@[m [mRails.application.routes.draw do[m
   get "movies/moviePicker", to: "movies#moviePicker", as: :movies_movie_picker[m
 [m
   resources :movies[m
[31m-  resources :users[m
 [m
   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.[m
   # Can be used by load balancers and uptime monitors to verify that the app is live.[m
[1mdiff --git a/test/controllers/users_controller_test.rb b/test/controllers/users_controller_test.rb[m
[1mdeleted file mode 100644[m
[1mindex 4a86815..0000000[m
[1m--- a/test/controllers/users_controller_test.rb[m
[1m+++ /dev/null[m
[36m@@ -1,38 +0,0 @@[m
[31m-require "test_helper"[m
[31m-[m
[31m-class UsersControllerTest < ActionDispatch::IntegrationTest[m
[31m-  setup do[m
[31m-    @user = users(:one)[m
[31m-  end[m
[31m-[m
[31m-  test "should get index" do[m
[31m-    get users_url, as: :json[m
[31m-    assert_response :success[m
[31m-  end[m
[31m-[m
[31m-  test "should create user" do[m
[31m-    assert_difference("User.count") do[m
[31m-      post users_url, params: { user: { lastname: @user.lastname, name: @user.name, password: @user.password, username: @user.username } }, as: :json[m
[31m-    end[m
[31m-[m
[31m-    assert_response :created[m
[31m-  end[m
[31m-[m
[31m-  test "should show user" do[m
[31m-    get user_url(@user), as: :json[m
[31m-    assert_response :success[m
[31m-  end[m
[31m-[m
[31m-  test "should update user" do[m
[31m-    patch user_url(@user), params: { user: { lastname: @user.lastname, name: @user.name, password: @user.password, username: @user.username } }, as: :json[m
[31m-    assert_response :success[m
[31m-  end[m
[31m-[m
[31m-  test "should destroy user" do[m
[31m-    assert_difference("User.count", -1) do[m
[31m-      delete user_url(@user), as: :json[m
[31m-    end[m
[31m-[m
[31m-    assert_response :no_content[m
[31m-  end[m
[31m-end[m
