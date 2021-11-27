class ComplainsController < ApplicationController
  before_action :set_complain, only: %i[ show edit update destroy ]

  # GET /complains or /complains.json
  def index
    @complains = Complain.all
    @users = User.all
  end

  # GET /complains/1 or /complains/1.json
  def show
    @comments = Comment.where(complain_id: @complain).order("created_at DESC")
  end

  # GET /complains/new
  def new
    @complain = Complain.new
  end

  # GET /complains/1/edit
  def edit
  end

  # POST /complains or /complains.json
  def create
    @complain = Complain.new(complain_params)
    @complain.user_id = current_user.id

    respond_to do |format|
      if @complain.save
        format.html { redirect_to @complain, notice: "Complain was successfully created." }
        format.json { render :show, status: :created, location: @complain }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @complain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complains/1 or /complains/1.json
  def update
    respond_to do |format|
      if @complain.update(complain_params)
        format.html { redirect_to @complain, notice: "Complain was successfully updated." }
        format.json { render :show, status: :ok, location: @complain }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @complain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complains/1 or /complains/1.json
  def destroy
    @complain.destroy
    respond_to do |format|
      format.html { redirect_to complains_url, notice: "Complain was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complain
      @complain = Complain.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def complain_params
      params.require(:complain).permit(:title, :content, :location, :start_date, :end_date, :resolve, :user_id, :image)
    end
end
