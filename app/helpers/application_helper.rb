module ApplicationHelper
  def upload_file_exists?(file_object)
    file_object.try(:file).try(:exists?)
  end

  def upvoted?(proposal)
    upvoted_proposals.include? proposal.id
  end

  def mark_upvoted(proposal)
    cookies.permanent.signed[:july_july] = JSON.generate(upvoted_proposals << proposal.id)
  end

  private

  def upvoted_proposals
    cookie_upvoted_proposals = cookies.permanent.signed[:july_july]
    upvoted_proposals = []
    if cookie_upvoted_proposals.present?
      upvoted_proposals = JSON.parse(cookie_upvoted_proposals)
    end
    upvoted_proposals
  end

end

