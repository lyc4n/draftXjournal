class DraftsController < ApplicationController

  def new
    @draft = Draft.new
  end

  def create
    @draft = Draft.new(draft_params.merge(user: current_user))
    if @draft.save
      redirect_to root_url, success: 'Great!'
    else
      flash.now[:error] = @draft.errors.full_messages.join("\n")
      render :new
    end
  end

  def show
    @draft = Draft.find(params[:id])
  end

  private

  def draft_params
    params.require(:draft).permit(:title, :content)
  end
end
