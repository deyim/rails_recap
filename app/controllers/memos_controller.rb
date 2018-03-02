class MemosController < ApplicationController
	before_action :find_memo, only: [:show, :edit, :update, :destroy]
	#before_action :authenticate_user!, except: [:show, :index]
  #TODO: user login과 결합
	#Create
  def new
  	@memo = Memo.new
  end

  def create
  	@memo = Memo.new(memo_params)
  	@memo.save

  	redirect_to @memo
  end

 # Read
  def show
    @comment = Comment.new
    @comments = @memo.comments
  end
#
  def index
  	@memos = Memo.order(created_at: :desc).page(params[:page])
  end

#Update
  def edit
  end

  def update
  	@memo = Memo.new(memo_params)
  	@memo.save

  	redirect_to @memo
  end

#Destroy
	def destroy
		@memo.destroy!
		redirect_to root_path
	end

	private

	def find_memo
		@memo = Memo.find(params[:id])
	end

	def memo_params
		params.require(:memo).permit(:title, :content, :user_id)
	end

end
