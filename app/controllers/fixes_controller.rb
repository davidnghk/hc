class FixesController < ApplicationController
  before_action :set_fix, only: [:show, :edit, :update, :destroy]

  # GET /fixes
  # GET /fixes.json
  def index
    @fixes = Fix.all
  end

  # GET /fixes/1
  # GET /fixes/1.json
  def show
  end

  # GET /fixes/new
  def new
    @fix = Fix.new
  end

  # GET /fixes/1/edit
  def edit
  end

  # POST /fixes
  # POST /fixes.json
  def create
    @fix = Fix.new(fix_params)

    respond_to do |format|
      if @fix.save
        format.html { redirect_to @fix, notice: 'Fix was successfully created.' }
        format.json { render :show, status: :created, location: @fix }
      else
        format.html { render :new }
        format.json { render json: @fix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fixes/1
  # PATCH/PUT /fixes/1.json
  def update
    respond_to do |format|
      if @fix.update(fix_params)
        format.html { redirect_to @fix, notice: 'Fix was successfully updated.' }
        format.json { render :show, status: :ok, location: @fix }
      else
        format.html { render :edit }
        format.json { render json: @fix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fixes/1
  # DELETE /fixes/1.json
  def destroy
    @fix.destroy
    respond_to do |format|
      format.html { redirect_to fixes_url, notice: 'Fix was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fix
      @fix = Fix.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fix_params
      params.require(:fix).permit(:type, :code, :name, :chi_name, :is_active?)
    end
end
