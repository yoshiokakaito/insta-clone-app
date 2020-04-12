class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.paginate(page: params[:page])
  end
end
