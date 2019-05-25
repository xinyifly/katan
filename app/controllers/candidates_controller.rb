class CandidatesController < ApplicationController
  def index
    @candidates = User.all
  end
end
