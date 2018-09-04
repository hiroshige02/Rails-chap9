class PostsController < ApplicationController

  def new
         @post = Post.new
  end

    # 以下を追加
  def create
    # ストロングパラメーター使用
    post = Post.new(post_params)
    # DBへ保存する
    post.save
    # トップ画面へリダイレクト postは名前付きルート
    redirect_to post_path(post.id)
  end

  def index
    @posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    #一覧画面に戻る
    redirect_to posts_path
  end


  private

    def post_params
        params.require(:post).permit(:title, :body, :image)
    end
end