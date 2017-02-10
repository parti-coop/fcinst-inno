class ProposalsController < ApplicationController
  include ApplicationHelper

  def upvote
    @proposal = Proposal.find(params[:id])
    return if upvoted?(@proposal)

    if @proposal.present?
      @proposal.upvotes_count += 1
      mark_upvoted(@proposal) if @proposal.save
    end

    redirect_to :back
  end
end
