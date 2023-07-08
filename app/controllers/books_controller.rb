class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    book= Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # 4. リダイレクト
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(book.id)
  end

  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to book_path(book.id)  # リダイレクト
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
