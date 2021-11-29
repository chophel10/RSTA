class AssignsController < ApplicationController
  before_action :set_assign, only: %i[ show edit update destroy ]

  # GET /assigns or /assigns.json
  def index
    if current_user.is_customercare
      @assigns = Assign.all
      @complains = Complain.all
    else
      redirect_to root_path, notice:"Not Authorized."
    end
  end

  # GET /assigns/new
  # def new
  #   @assign = Assign.new
  # end

  # GET /assigns/1/edit
  # def edit
  # end

  # POST /assigns or /assigns.json
  def create
    if current_user.is_admin
      @assign = Assign.new(assign_params)
  
      respond_to do |format|
        if @assign.save
          ComplainMailer.with(email: @assign.user.email).assign.deliver
          format.html { redirect_to @assign, notice: "Assign was successfully created." }
          format.json { render :show, status: :created, location: @assign }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @assign.errors, status: :unprocessable_entity }
        end
      end
      else
        redirect_to root_path, notice: "Not authorized"
    end
  end

  # PATCH/PUT /assigns/1 or /assigns/1.json
  # def update
  #   respond_to do |format|
  #     if @assign.update(assign_params)
  #       format.html { redirect_to @assign, notice: "Assign was successfully updated." }
  #       format.json { render :show, status: :ok, location: @assign }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @assign.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /assigns/1 or /assigns/1.json
  # def destroy
  #   @assign.destroy
  #   respond_to do |format|
  #     format.html { redirect_to assigns_url, notice: "Assign was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assign
    @assign = Assign.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def assign_params
    params.require(:assign).permit(:user_id, :complain_id)
  end
end
