class TweetsController < ApplicationController


  before_filter :get_zombie

  def get_zombie 
    @zombie = Zombie.find(params[:zombie_id])
  end

  # GET /zombies/zombie_id/tweets
  # GET /zombies/zombie_id/tweets.json
  def index
    @tweets = @zombie.tweets
    respond_to do |format|
      format.html
      format.json{render :json => @tweets}
    end
  end

  # GET /zombies/zombie_id/tweets/1
  # GET /zombies/zombie_id/tweets/1.json
  def show
    @tweet = @zombie.tweets.find(params[:id])
  end

  # GET /zombies/new
  def new
    @tweet = Tweet.new
  end

  # GET /zombies/1/edit
  def edit
  end



  # POST /zombies
  # POST /zombies.json
  def create
    @tweet = @zombie.tweets.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to [@zombie, @tweet], notice: 'Tweet was successfully created.' }
        format.json { render action: 'show', status: :created, location: [@zombie,@tweet] }
      else
        format.html { render action: 'new' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  #PATCH/GET /zombies/1/updateName/
  # PATCH/GET /zombies/1/updateName.json
  def updateName 
    
    @tweet = Zombie.find(params[:id]);

  end

  # PATCH/PUT /zombies/1
  # PATCH/PUT /zombies/1.json
  def update
    respond_to do |format|
      if @brain.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # DELETE /zombies/1
  # DELETE /zombies/1.json
  def destroy
    @zombie.tweet.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to zombie_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zombie
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:text)
    end
end
