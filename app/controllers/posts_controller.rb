class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(get_post_params())
    
    if @post.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :posts
    else
      flash[:alert] = "スケジュールを登録できませんでした"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(get_post_params())
      flash[:notice] = "スケジェールを更新しました"
      redirect_to :posts
    else
      flash[:alert] = "スケジェールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @post.destroy

    # 自動で303: See Otherを指定されないので手動で送信する.
    respond_to do |format|
      format.html { redirect_to :posts, notice: "ユーザーを削除しました", status: :see_other }
      format.json { head :no_content }
    end
  end
end

private

def set_post
  @post = Post.find(params[:id])
end

def get_post_params
  params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memorandum)
end
