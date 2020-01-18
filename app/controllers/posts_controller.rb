class PostsController < ApplicationController
    before_action :authenticate_user!, :admin_authenticate
    skip_before_action :admin_authenticate, only: [:show, :index]

    def index
        @posts = Post.order(created_at: :desc).page params[:page]
        @comments = Comment.order(created_at: :desc)
    end

    def show
        @post = Post.find(params[:id])
    end
    
    def new
        @post = Post.new
    end

    def edit
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(post_params)
        
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def update
        @post = Post.find(params[:id])
        authorize @post
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end
end

private
    def post_params
        params.require(:post).permit(:title, :text)
    end