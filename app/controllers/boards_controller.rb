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
    Board.create(board_params)
    redirect_to("/boards")
  end

  def show
    @board = Board.find(params[:id])
  end

  private
  #このprivateメソッドをよび、name,title,bodyのkeyのみ保存する。
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

end
