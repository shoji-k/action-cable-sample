class EditorChannel < ApplicationCable::Channel
  def subscribed
    stream_from "editor_#{params[:name]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def sync(data)
    # p content['content']
      ActionCable.server.broadcast "editor_#{params[:name]}", content: data['content']
  end
end
