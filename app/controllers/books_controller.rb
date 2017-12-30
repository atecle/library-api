class BooksController < ApplicationController
  before_action :set_book, :validate_params, only: [:show, :update, :destroy]

  ActionController::Parameters.action_on_unpermitted_parameters = :raise

# post/delete requests are disabled for now.

  rescue_from(ActionController::UnpermittedParameters) do |pme|
  render json: { error:  { unknown_parameters: pme.params } },
             status: :bad_request
  end

  # GET /books
  def index
    @books = Book.all

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.permit(:title, :author)
    end

    def validate_params
     book = Validate::Book.new(params)
     if !book.valid?
       render json: { error: book.errors } and return
     end
   end
end

module Validate
  class Book

    attr_accessor :title, :author

    def initialize(params={})
      @title  = params[:title]
      @author = params[:author]
      ActionController::Parameters.new(params).permit(:title,:author)
    end

  end
end
