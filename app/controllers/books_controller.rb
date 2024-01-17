class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :index
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @profile_image = @user.get_profile_image(100, 100)
    @name = User.all
    @introduction = current_user.introduction
  end

  def show
    @book = Book.all
    if @book.save
      redirect_to book_path
    else
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
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
