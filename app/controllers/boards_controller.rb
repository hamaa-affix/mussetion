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
    @board = Board.new(flash[:board])
  end

  def create
    board = Board.new(board_params)
    #newしてsaveしていく
    if board.save
      #flashMessage
      flash[:notice] = "「#{borad.title}」のメッセージを作成しました"
      redirect_to borad
    else
      #saveに失敗したらredirectしてboardオブジェクトとエラーメッセージを返している
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    #boardに紐すたcommentオブジェクトを生成
    @comment = Comment.new(board_id: @board.id)
    # ここで渡している変数は@board,@comment
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to @board
    else
      redirect_to :back, flash: {
        board: @board,
        error_messages: @board.errors.full_messages
      }
    end
  end



    @board.update(board_params)
    #redirect_toの引数変数を渡すことでboards/:idのURLを生成してくれる。
    redirect_to @board
  end

  def destroy
    @board.destroy
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
