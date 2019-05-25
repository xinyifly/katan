module CandidatesHelper
  def link_to_vote(candidate_id)
    link_to 'Vote', votes_path(vote: { candidate_id: candidate_id }), method: :post
  end
end
