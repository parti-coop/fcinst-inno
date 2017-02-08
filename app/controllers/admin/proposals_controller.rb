module Admin
  class ProposalsController < BaseController
    def create
      @proposal = Proposal.new(proposal_params)
      if @proposal.save
        flash[:success] = '저장되었습니다'
        redirect_to admin_interview_path(@proposal.interview)
      else
        errors_to_flash(@proposal)
        render admin_interview_path(@proposal.interview)
      end
    end

    def update
      @proposal = Proposal.find(params[:id])
      if @proposal.update_attributes(proposal_params)
        flash[:success] = '저장되었습니다'
        redirect_to admin_interview_path(@proposal.interview)
      else
        errors_to_flash(@proposal)
        render admin_interview_path(@proposal.interview)
      end
    end

    def destroy
      @proposal = Proposal.find(params[:id])
      unless @proposal.destroy
        errors_to_flash(@proposal)
      end

      redirect_to admin_interview_path(@proposal.interview)
    end

    private

    def proposal_params
      params.require(:proposal).permit(:title, :image, :interview_id)
    end
  end
end
