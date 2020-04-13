module NotificationsHelper
  def notification_form(notification)
    @comment=nil
    visitor=link_to notification.visitor.name, notification.visitor, style:"font-weight: bold;"
    case notification.action
      when "follow" then
        "#{visitor}があなたをフォローしました"
      when "like" then
        "#{visitor}があなたの投稿にいいね！しました"
      when "comment" then
        @comment=Comment.find_by(id:notification.comment_id)&.content
        "#{visitor}があなたの投稿にコメントしました"
    end
  end
end
