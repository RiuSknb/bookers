class BooksController < ApplicationController
  # def new
  #   @book = Book.new
  # end
  def books
  # books.html erbからの入力

    @book = Book.new
    #createへの受け渡し

    @books = Book.all
    #Book（保存してあるデータ）を全取得
  end



  def create
    # データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    book.save

    # 4. index画面へリダイレクト
    redirect_to '/books'
  end


  # def index⇒booksに変更
  # end

  def show
  end

  def edit
  end
  # # 9/12追記
  # def books
  # end

  private
  #
  def book_params
    params.require(:book).permit(:title, :body)
    # params:formから送られてくるデータ
    # require:送られてきたデータから、モデル名:bookを指定し、データを絞り込む。
    # permit:requireで絞ったデータ野中から、保存を許可するｶﾗﾑを指定
  end
end
