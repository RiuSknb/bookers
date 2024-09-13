class BooksController < ApplicationController

  def index
    @book = Book.new
    #createへの受け渡し
    @books = Book.all
    #Book（保存してあるデータ）を全取得
  end


  def create
    # データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)

    # データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else
      # `books/books`というビューファイルを表示するための命令
      @books = Book.all
      # →　@listsが空になっているため、再度定義する。

      render :index
    end
  end


  def show
    @book = Book.find(params[:id])
  end


  def edit
    @book = Book.find(params[:id])
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books', notice: 'Book was successfully destroyed.'
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
    # params:formから送られてくるデータ
    # require:送られてきたデータから、モデル名:bookを指定し、データを絞り込む。
    # permit:requireで絞ったデータ野中から、保存を許可するｶﾗﾑを指定
  end
end
