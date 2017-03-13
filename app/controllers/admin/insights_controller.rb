module Admin
  class InsightsController < BaseController
    def index
      @insights = Insight.all
    end

    def show
      @insight = Insight.find(params[:id])
    end

    def new
      @insight = Insight.new
    end

    def create
      @insight = Insight.new(insight_params)
      if @insight.save
        flash[:success] = '저장되었습니다'
        redirect_to admin_insights_path
      else
        errors_to_flash(@insight)
        render 'admin/insights/new'
      end
    end

    def update
      @insight = Insight.find(params[:id])
      if @insight.update_attributes(insight_params)
        flash[:success] = '저장되었습니다'
        redirect_to admin_insight_path(@insight)
      else
        errors_to_flash(@insight)
        render 'admin/insights/index'
      end
    end

    def destroy
      @insight = Insight.find(params[:id])
      unless @insight.destroy
        errors_to_flash(@insight)
      end

      redirect_to admin_insights_path
    end

    private

    def insight_params
      params.require(:insight).permit(:title, :body, :image, :image_thumbnail, :summary)
    end
  end
end
