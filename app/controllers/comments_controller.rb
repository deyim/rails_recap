class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_comment, only: [:destroy]
	before_action :if_owner?, only: [:destroy]
	#TODO: user login과 결합
	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			redirect_to memo_path(params[:memo_id])
		else
			redirect_back(fallback_location: root_path)
		end
	end

	def destroy
		@comment.destroy 
		redirect_back(fallback_location: root_path)
	end

	private
	def find_comment
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:user_id, :memo_id, :content)
	end

	def if_owner?
    	redirect_to root_path unless current_user == @comment.user
 	end
end
