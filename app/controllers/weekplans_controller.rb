class WeekplansController < ApplicationController

	def index
    @weekplans = Weekplan.find_all_by_user_id(current_user.id)
    @activities = PublicActivity::Activity.order("created_at desc")
    if @weekplans.blank?
      redirect_to new_weekplan_path
    end
  end

  def new
    @weekplan = Weekplan.has_one_week_plan?(current_user.id)
    if @weekplan.blank?
      @weekplan = Weekplan.new
    else
      redirect_to edit_weekplan_path(@weekplan), notice: 'You already have Schedule this week'
    end
  end

  def edit
    if Weekplan.currentuser_this_week(current_user.id)
      @weekplan = Weekplan.currentuser_this_week(current_user.id)
    else
      redirect_to new_weekplan_path, notice: "You don't have Schedule this week"
    end
  end

	def show
    @weekplan = Weekplan.find(params[:id])
  end

  def create
    @weekplan = current_user.weekplans.new(params[:weekplan])

    respond_to do |format|
      if @weekplan.save
        redirect_to @weekplan, notice: 'Weekplans was successfully created.'
      else
        render action: "new"
      end
    end
  end

  def update
    @weekplan = Weekplan.currentuser_this_week(current_user.id)

    respond_to do |format|
      if @weekplan.first.update_attributes(params[:weekplan])
        redirect_to @weekplan, notice: 'Weekplan was successfully updated.'
      else
        render action: "edit"
      end
    end
  end

  def destroy
    @weekplan = Weekplan.currentuser_this_week(current_user.id)
    @weekplan.destroy
    redirect_to weekplans_url
  end
end
