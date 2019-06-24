class VotesController < ApplicationController
  before_action :set_vote, only: [:show]
  before_action :authenticate_user!, only: [:create]

  def new
    @vote = Vote.new
  end

  def create
    candidate = Candidate.find(vote_params[:candidate_id])
    @vote = current_user.vote(candidate)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:candidate_id)
  end
end
