class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: "Your vote was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id_id])
    vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: "Vote was successfully destroyed." }
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:article_id)
  end
end
