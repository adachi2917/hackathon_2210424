class PostsController < ApplicationController
    before_action :find_post, only: %i[update edit destroy]
    def index;
        @posts = Post.all.order(created_at: :desc)
    end
    def new
        @post = Post.new
    end
    def show
        @post=Post.find_by(id:params[:id])
    end
    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:notice] = "投稿を作成しました"
            redirect_to('/posts/index')
        else
            render('/posts/new')
        end 
    end
    def edit;

    end
    def update
        if @post.update(post_params)
            flash[:notice] = "投稿を編集しました"
            redirect_to('/posts/index')
        else
            render('/posts/edit')
        end
    end
    
    def destroy
        if @post.destroy
            flash[:notice] = "投稿を削除しました"
            redirect_to('/posts/index')
        else
            redirect_to('/posts/edit')
        end
    end

    private
    def post_params
        params.permit(:content)
    end
    def find_post
        @post = Post.find(params[:id])
    end
end
