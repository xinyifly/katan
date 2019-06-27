class CandidatesController < ApplicationController
  def index
    if params[:poll_id]
      poll = Poll.find(params[:poll_id])
      @candidates = poll.candidates
    else
      @candidates = Candidate.where(poll: nil)
    end
  end
end
