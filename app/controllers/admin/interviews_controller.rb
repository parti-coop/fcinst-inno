module Admin
  class InterviewsController < BaseController
    def index
      @interviews = Interview.all
    end

    def show
      @interview = Interview.find(params[:id])
      get_or_build_proposals
    end

    def new
      @interview = Interview.new
      get_or_build_proposals
    end

    def create
      @interview = Interview.new(interview_params)
      if @interview.save
        flash[:success] = '저장되었습니다'
        redirect_to admin_interviews_path
      else
        errors_to_flash(@interview)
        render admin_interviews_path
      end
    end

    def update
      @interview = Interview.find(params[:id])
      if @interview.update_attributes(interview_params)
        flash[:success] = '저장되었습니다'
        redirect_to admin_interview_path(@interview)
      else
        errors_to_flash(@interview)
        render admin_interview_path(@interview)
      end
    end

    def destroy
      @interview = Interview.find(params[:id])
      unless @interview.destroy
        errors_to_flash(@interview)
      end

      redirect_to admin_interviews_path
    end

    private

    def interview_params
      params.require(:interview).permit(:name, :organization, :image, :image_thumbnail, :message, :video_url, :introduction, :summary)
    end

    def get_or_build_proposals
      if @interview.proposals.present?
        @proposals = @interview.proposals
      end

      while @interview.proposals.size < 2
        @interview.proposals.build
        @proposals = @interview.proposals
      end
    end
  end
end
