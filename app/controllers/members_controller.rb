class MembersController < ApplicationController
  before_action :logged_in_member, only: [:edit, :update]
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    @members = Member.order(params[:group_id])

    if(!logged_in?)
      redirect_to new_member_path
    end
  end

  # GET /members/1 or /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        log_in @member
        format.html { redirect_to home_index_path(uid: @member.id, desired_date: Date.today.to_s), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        if current_member.superUser
          format.html { redirect_to members_url, notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { redirect_to home_index_path(uid: @member.id, desired_date: Date.today.to_s), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @member }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Confirms a logged-in member
    def logged_in_member
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.fetch(:member, {}).permit(:display_name, :email, :password, :password_confirmation, :group_id, :image, :superUser)
    end
end
