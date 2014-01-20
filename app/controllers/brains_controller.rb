class BrainsController < ApplicationController



  # GET /zombies
  # GET /zombies.json
  def index
    @brains = Brain.all
    respond_to do |format|
      format.html
      format.json{render :json => @brains}
    end
  end

  # GET /zombies/1
  # GET /zombies/1.json
  def show
  end

  # GET /zombies/new
  def new
    @brain = Brain.new
  end

  # GET /zombies/1/edit
  def edit
  end



  # POST /zombies
  # POST /zombies.json
  def create
    @brain = Brain.new(brain_params)

    respond_to do |format|
      if @brain.save
        format.html { redirect_to @brain, notice: 'Brain was successfully created.' }
        format.json { render action: 'show', status: :created, location: @brain }
      else
        format.html { render action: 'new' }
        format.json { render json: @brain.errors, status: :unprocessable_entity }
      end
    end
  end

  #PATCH/GET /zombies/1/updateName/
  # PATCH/GET /zombies/1/updateName.json
  def updateName 
    
    @brain = Zombie.find(params[:id]);
    logger.info @brain

  end

  # PATCH/PUT /zombies/1
  # PATCH/PUT /zombies/1.json
  def update
    respond_to do |format|
      if @brain.update(brain_params)
        format.html { redirect_to @brain, notice: 'Zombie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @brain.errors, status: :unprocessable_entity }
      end
    end
  end

  def editWithData
    @brain = Zombie.find(params[:id])
    @brain.update_attributes(:name => params[:name])
    @brain.update_attributes(:age => params[:age])
    redirect_to :action => 'index'

  end

  # DELETE /zombies/1
  # DELETE /zombies/1.json
  def destroy
    @brain.destroy
    respond_to do |format|
      format.html { redirect_to brain_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zombie
      @brain = Brain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brain_params
      params.require(:brain).permit(:zombie_id, :status, :flavor)
    end
end
