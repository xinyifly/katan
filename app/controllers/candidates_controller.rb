class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.where(poll: nil)
  end
end
