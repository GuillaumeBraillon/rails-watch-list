class ListsController < ApplicationController
    before_action :set_list, only: [ :show, :edit, :update ]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

def show
  @movies = @list.movies
  @movie = Movie.new
  @bookmarks = @list.bookmarks
  @bookmark = Bookmark.new
  @reviews = @list.reviews
  @review = Review.new
end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list), notice: "List updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

    private

  def set_list
    @list = List.find(params[:id])
  end


    def list_params
      params.require(:list).permit(:name, :photo)
    end
end
