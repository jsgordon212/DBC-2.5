class PostsController < ApplicationController

	include PostsHelper

	def index
		@latest = Post.all.reverse
	end


	def show
		@post = Post.find_by_id params[:id]
	end


	def new
		if login?
			@post = Post.new
			render 'new'
		else
			redirect_to root_path
		end
	end

	def edit
		@post = Post.find_by_id params[:id]
		if @post.user == current_user
			render 'edit'
		else
			redirect_to '/'
		end
	end


	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id if current_user

		if @post.save
  		redirect_to @post
  	else
  		render 'new'
  	end

	end

	def update
		@post = Post.find_by_id params[:id]

		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find_by_id params[:id]
		if @post.user == current_user
			@post.destroy
			redirect_to current_user
		else
			redirect_to posts_path
		end
	end


	private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
