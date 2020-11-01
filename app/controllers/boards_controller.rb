class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    #modelインスタンスを作成
    #controller内で作成したインスタンス変数はviewで参照できる。
    @board = Board.new
  end

  def create
    #laravelでいうstore method
    Board.create(board_params)
    redirect_to board
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])

  end

  def update
    board = Board.find(params[:id])
    board.update(board_params)
    #redirect_toの引数変数を渡すことでboards/:idのURLを生成してくれる。
    redirect_to board
  end

  def destroy
    board = Board.find(params[:id])
    board.delete
 
    redirect_to boards_path
  end

  private
  #このprivateメソッドをよび、name,title,bodyのkeyのみ保存する。
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end



end
