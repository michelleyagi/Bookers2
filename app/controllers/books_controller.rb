class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @users =User.all
      render :index
    end
  end

  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.where(user_id: @book.user_id)
    @user = @book.user
  end
  
  def edit
    @book=Book.find(params[:id])
  end
  
  def update
    @book= Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
