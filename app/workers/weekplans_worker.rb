class WeekplansWorker
  include Sidekiq::Worker
  
  def perform(weekplan_id)
    share_post(current_user.id, user_weekplan_url(weekplan_id))
  end
end