class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_back(fallback_location: article_path(@vote.article)) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    vote.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: categories_path) }
    end
  end

  private

  def vote_params
    params.permit(:article_id)
  end
end
