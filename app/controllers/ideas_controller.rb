class IdeasController < ApplicationController


  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      redirect_to current_user
    end
  end

  def show
    @idea = current_user.ideas.find(params[:id])
  end

  def destroy
    @idea = current_user.ideas.find(params[:id])
    @idea.delete
    redirect_to current_user
  end

  def edit
    @idea = current_user.ideas.find(params[:id])
  end

  def update
    @idea = current_user.ideas.find(params[:id])
    @idea.update(idea_params)

    redirect_to current_user
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :description)
  end

end
