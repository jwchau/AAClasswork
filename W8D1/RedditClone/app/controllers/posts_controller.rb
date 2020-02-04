class PostsController < ApplicationController
    before_action :require_login, except: [:show]

    def new
        @posts = Post.new
        @subs = Sub.all
        render :new
    end

    def create
        flash[:errors] =[]
        @post_subs = params[:post][:subs]
        debugger
        params[:post][:subs].each do |sub_id|
            @post = Post.new(post_params)
            @post.author_id = current_user.id
            @post.sub_id = sub_id
            if @post.save
                puts "post saved"
            else
                flash[:errors] += @post.errors.full_messages
            end 
        end
        redirect_to post_url(Post.last)
            
    end

    def show
        @post = Post.find_by(id: params[:id])
        if @post
            render :show
        else
            flash[:errors] = ['Post does not exist']
            render '404.html.erb'
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
        if current_user.id == @post
            render :edit
        end
    end

    def update
        @post = Post.find_by(id: params[:id])
        if can_edit?(@post.author_id) && @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = ['Could not edit post']
            render :edit
        end 
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        # if @post && current_user.id == @post.author_id
        if @post && can_edit?(@post.author_id)
            @post.destroy
            redirect_to subs_url
        else
            flash[:errors] = ['could not destroy post']
            redirect_to subs_url
        end 
    end



    # def index
    #     @posts = Post.all
    #     render :index
    # end

    private 

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_ids => [])
    end
end
