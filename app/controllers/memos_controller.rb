class MemosController < ApplicationController
	before_action :find_memo, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:show, :index]
  before_action :if_owner?, only: [:edit, :update, :destroy]
  #TODO: user login과 결합
	#Create
  def new
  	@memo = Memo.new
  end

  def create
  	@memo = Memo.new(memo_params)
  	if @memo.save
      flash[:notice] = '메모를 작성하였습니다.'
      redirect_to @memo
    else
      #redirect_back(fallback_location: root_path)
      render :new
    end
  end

 # Read
  def show
    @comment = Comment.new
    @comments = @memo.comments.order(created_at: :desc)
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
  	if @memo.save
      redirect_to @memo
    else
      render :edit
    end

  	
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

  def if_owner?
    redirect_to root_path unless current_user == @memo.user
  end

  def save_check
    if @memo.save
      redirect_to @memo
    else
      redirect_to :new
    end
  end

end
