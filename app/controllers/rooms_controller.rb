class RoomsController < ApplicationController
  def show
    @messages = Message.all
  end

  def index
    render json: {
      id: 10,
      messages: [
        {id: 1, content: 'hey'},
        {id: 2, content: 'yo'}
      ]
    }
  end
end
