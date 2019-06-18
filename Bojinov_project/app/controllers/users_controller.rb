class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @page = params[:page]
    @page ||= 1
    page_size = 2
    @users = User.all.paginate(:page => @page, :per_page => page_size)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      if User.where(id: params[:id]).empty?
        format.json { render :index, status: :unprocessable_entity, notice: 'No such entry' }
      else
        set_user
        format.html
        format.json { render :show, status: :created, location: @user }
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        ConfirmationMailer.confirmation_email(@user).deliver_now

        format.html { redirect_to @user, notice: "User was successfully created.
          You need to confirm your registration on the mail you gave us." }
        format.json { render :show, status: :created, location: @user}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    params[:user][:confirmed] = true

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    set_user

    respond_to do |format|
      format.html do
        @user.confirmed = true
        render :show 
      end
    end
    @user.confirmed = true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :pass, :email, :confirmed)
    end
end
