class WeekplansController < ApplicationController
	def index
    @weekplans = Weekplan.all   
  end

  def new
    @weekplan = Weekplan.new
  end

  def edit
    @weekplan = Weekplan.find(params[:id])
  end

	def show
    @weekplan = Weekplan.find(params[:id])
  end

  def create
    @weekplan = Weekplan.new(params[:weekplan])

    respond_to do |format|
      if @weekplan.save
        redirect_to @weekplan, notice: 'Weekplans was successfully created.'
      else
        render action: "new"
      end
    end
  end

  def update
    @weekplan = Weekplan.find(params[:id])

    respond_to do |format|
      if @weekplan.update_attributes(params[:weekplan])
        redirect_to @weekplan, notice: 'Weekplan was successfully updated.'
      else
        render action: "edit"
      end
    end
  end

  def destroy
    @weekplan = Weekplan.find(params[:id])
    @weekplan.destroy
    redirect_to weekplans_url
  end
end
