class MicroblogsController < ApplicationController
  before_action :set_microblog, only: [:show, :edit, :update, :destroy]

  # GET /microblogs
  # GET /microblogs.json
  def index
    @microblogs = Microblog.all
  end

  # GET /microblogs/1
  # GET /microblogs/1.json
  def show
  end

  # GET /microblogs/new
  def new
    @microblog = Microblog.new
  end

  # GET /microblogs/1/edit
  def edit
  end

  # POST /microblogs
  # POST /microblogs.json
  def create
    @microblog = Microblog.new(microblog_params)

    respond_to do |format|
      if @microblog.save
        format.html { redirect_to @microblog, notice: 'Microblog was successfully created.' }
        format.json { render :show, status: :created, location: @microblog }
      else
        format.html { render :new }
        format.json { render json: @microblog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microblogs/1
  # PATCH/PUT /microblogs/1.json
  def update
    respond_to do |format|
      if @microblog.update(microblog_params)
        format.html { redirect_to @microblog, notice: 'Microblog was successfully updated.' }
        format.json { render :show, status: :ok, location: @microblog }
      else
        format.html { render :edit }
        format.json { render json: @microblog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microblogs/1
  # DELETE /microblogs/1.json
  def destroy
    @microblog.destroy
    respond_to do |format|
      format.html { redirect_to microblogs_url, notice: 'Microblog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_microblog
      @microblog = Microblog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def microblog_params
      params.require(:microblog).permit(:content, :user_id, :tag)
    end
end
