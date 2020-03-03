class LoginstatusChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    LoginstatusChannel.status(Users.all)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def self.status(users)
    ActionCable.server.broadcast('login_status_channel', history: users)
  end

end
