class ProposalsController < ApplicationController
  include ApplicationHelper

  def upvote
    if request.format == 'text/javascript'
      @proposal = Proposal.find(params[:id])
      return if upvoted?(@proposal)

      if @proposal.present?
        @proposal.upvotes_count += 1
        mark_upvoted(@proposal) if @proposal.save
      end
    end

    respond_to do |format|
      format.js
      format.any { redirect_to root_path }
    end
  end
end
