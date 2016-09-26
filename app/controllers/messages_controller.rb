class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    # @message = Message.new
  end

  def create
    message = Message.new({to: params[:to], body: params[:body]})
    # if message.save
      redirect_to root_path, notice: 'message sent!'
    # else
      # redirect_to new_messages_path, alert: 'fail!'
    # end
  end

  def show
    @message = Message.find(params[:id])
  end

private
  def message_params
    params.require(:message).permit(:to, :body)
  end

end
