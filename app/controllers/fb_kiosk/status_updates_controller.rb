class FbKiosk::StatusUpdatesController < ApplicationController

  before_action :validate_fb_auth
  before_action :set_graph

  def index
    @status_updates = FbKiosk::StatusUpdatesIndex.new
  end

  def create
    @status_update = FbPost.new(fb_post_params)

    if @fb_post.save
      if !@fb_post.post_date.present?
        @graph.put_wall_post(@fb_post.content)
      end
      redirect_to fb_posts_path, notice: 'Great!'
    else
      flash.now[:error] = @fb_post.errors.full_messages.join(', ')
      render :index
    end
  end

  private

  def fb_post_params
    params.require(:fb_post).permit(:content, :post_date)
  end

  def validate_fb_auth
    if !current_user.fb_auth
      render :fb_auth_required
    end
  end

  def set_graph
    @graph = Koala::Facebook::API.new(current_user.fb_token)
  end
end
