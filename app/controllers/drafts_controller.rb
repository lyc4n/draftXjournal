class DraftsController < ApplicationController

  before_action :set_draft, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @draft.update(draft_params)
      redirect_to @draft, success: "#{@draft.title} have been updated."
    else
      flash.now[:error] = @draft.errors.full_messages.join("\n")
      render :edit
    end
  end

  def destroy
    @draft.destroy
    redirect_to root_path, success: "#{@draft.title} have been deleted."
  end

  private

  def set_draft
    @draft = current_user.drafts.find(params[:id])
  end

  def draft_params
    params.require(:draft).permit(:title, :content)
  end
end
