class BoardsController < ApplicationController
  # before_actionメソッド使用することで各アクションが実行される前に自動的にシンボルふが呼び出される
  # phpでいるconstructerの役割か
  before_action :set_target_board, only: %i[show edit update, destroy]

  def index
    #kaminariをインストールしたことでpagesメソッドが使用可能とり引数に指定したページに表示する
    #defaultでは25件の検索
    @boards = Board.page(params[:page])
  end

  def new
    #modelインスタンスを作成
    #controller内で作成したインスタンス変数はviewで参照できる。
    @board = Board.new
  end

  def create
    #laravelでいうstore method
    borad = Board.create(board_params)
    #flashに任意のkyeに値を設定することで次に値を参照されるまで、セッションにデータが保存される(フラッシュ変数)
    flash[:notice] = "「#{borad.title}」のメッセージを作成しました"
    redirect_to borad
  end

  def show
  end

  def edit
  end

  def update
    @board.update(board_params)
    #redirect_toの引数変数を渡すことでboards/:idのURLを生成してくれる。
    redirect_to @board
  end

  def destroy
    @board.delete
    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました"}
  end

  private
  #このprivateメソッドをよび、name,title,bodyのkeyのみ保存する。
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  def set_target_board
    # 他のメソッドから参照できるようにインスタンス変数で定義する
    @board = Board.find(params[:id])
  end



end
