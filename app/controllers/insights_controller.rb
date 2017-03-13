class InsightsController < ApplicationController
  def index
    reset_meta_tags_for_index
    @insights = Insight.all
  end

  def show
    @insight = Insight.find(params[:id])
    reset_meta_tags_for_show(@insight)
  end

  private

  def reset_meta_tags_for_index
    prepare_meta_tags({
      title: "당신은 혁신의 편입니까? | 인사이트",
      description: "앞장 서서 혁신의 편에 있는 사람들의 이야기에서 발견한 인사이트를 공유합니다. ",
      url: request.original_url}
    )
  end

  def reset_meta_tags_for_show(insight)
    prepare_meta_tags({
      title: "당신은 혁신의 편입니까? | #{@insight.title}",
      description: @insight.summary,
      image: @insight.image.url,
      url: request.original_url}
    )
  end
end
