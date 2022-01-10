class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    if comment.save
        render 'book_comments'
    else
        @error_comment = comment
        @user = @book.user
        @book_comment = BookComment.new
        render 'books/show'
    end
  end

  def destroy
    BookComment.find_by(id: params[:id]).destroy
    @book = Book.find(params[:book_id])
    render 'book_comments'
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
