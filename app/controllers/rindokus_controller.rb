class RindokusController < ApplicationController
  before_action :set_rindoku, only: [:show, :edit, :update, :destroy]

  # GET /rindokus
  # GET /rindokus.json
  def index
    @rindokus = Rindoku.all
  end

  # GET /rindokus/1
  # GET /rindokus/1.json
  def show
  end

  # GET /rindokus/new
  def new
    @rindoku = Rindoku.new
  end

  # GET /rindokus/1/edit
  def edit
  end

  # POST /rindokus
  # POST /rindokus.json
  def create
    @rindoku = Rindoku.new(rindoku_params)

    respond_to do |format|
      if @rindoku.save
        format.html { redirect_to @rindoku, notice: 'Rindoku was successfully created.' }
        format.json { render :show, status: :created, location: @rindoku }
      else
        format.html { render :new }
        format.json { render json: @rindoku.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rindokus/1
  # PATCH/PUT /rindokus/1.json
  def update
    respond_to do |format|
      if @rindoku.update(rindoku_params)
        format.html { redirect_to @rindoku, notice: 'Rindoku was successfully updated.' }
        format.json { render :show, status: :ok, location: @rindoku }
      else
        format.html { render :edit }
        format.json { render json: @rindoku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rindokus/1
  # DELETE /rindokus/1.json
  def destroy
    @rindoku.destroy
    respond_to do |format|
      format.html { redirect_to rindokus_url, notice: 'Rindoku was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rindoku
      @rindoku = Rindoku.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rindoku_params
      params.require(:rindoku).permit(:year, :semester, :book_id)
    end
end
