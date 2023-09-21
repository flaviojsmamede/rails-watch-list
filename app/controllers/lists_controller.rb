class ListsController < ApplicationController
  # before_action :set_list, only: [:show]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    # redirect_to lists_path
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    # @bookmark = Bookmark.find(@list.id)
    # @bookmark = Bookmark.select { |bookmark| bookmark.list_id }
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  # def set_list
  #   @list = List.find(params[:id])
  # end

  def list_params
    params.require(:list).permit(:name)
  end
end


# As a user, I can see all my movie lists ------------ DONE
# As a user, I can create a movie list ----- DONE
# As a user, I can see the details of a movie list ---- DONE
# As a user, I can bookmark a movie inside a movie list
# As a user, I can destroy a bookmark
