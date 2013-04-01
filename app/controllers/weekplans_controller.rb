class WeekplansController < ApplicationController
	def index
    @weekplans = Weekplan.all
 
    respond_to do |format|
      format.html #index.html.slim
      format.json { render json: @weekplans }
    end
  end

  def new
    @weekplan = Weekplan.new

    respond_to do |format|
      format.html # new.html.slim
      format.json { render json: @weekplan }
    end
  end

  def edit
  	@weekplan = Weekplan.find(params[:id])
  end

	def show
  	@weekplan = Weekplan.find(params[:id])

    respond_to do |format|
      format.html # show.html.slim
      
      format.json { render json: @weekplan }
    end
  end

  def create
    @weekplan = Weekplan.new(params[:weekplan])

    respond_to do |format|
      if @weekplan.save
        format.html { redirect_to @weekplan, notice: 'Weekplans was successfully created.' }
        format.json { render json: @weekplan, status: :created, location: @weekplan }
      else
        format.html { render action: "new" }
        format.json { render json: @weekplan.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @weekplan = Weekplan.find(params[:id])

    respond_to do |format|
      if @weekplan.update_attributes(params[:weekplan])
        format.html { redirect_to @weekplan, notice: 'Weekplan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weekplan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @weekplan = Weekplan.find(params[:id])
    @weekplan.destroy

    respond_to do |format|
      format.html { redirect_to weekplans_url }
      format.json { head :no_content }
    end
  end

end
