class InterviewsController < ApplicationController
  def index
    reset_meta_tags_for_index
    @interviews = Interview.recent
  end

  def show
    @interview = Interview.find(params[:id])
    reset_meta_tags_for_show(@interview)
  end

  private

  def reset_meta_tags_for_index
    prepare_meta_tags({
      title: "당신은 혁신의 편입니까? | 혁신가들의 인터뷰",
      description: "사회 혁신의 맨 앞이기에 누구보다 먼저 겪는 어려움, 어떻게 해결할 수 있을까요? ",
      url: request.original_url}
    )
  end

  def reset_meta_tags_for_show(interview)
    prepare_meta_tags({
      title: "당신은 혁신의 편입니까? | #{@interview.name}님의 인터뷰",
      description: @interview.summary,
      image: @interview.image.url,
      url: request.original_url}
    )
  end
end
