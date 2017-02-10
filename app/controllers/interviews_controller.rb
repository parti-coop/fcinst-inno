class InterviewsController < ApplicationController
  def index
    @interviews = []
    6.times { @interviews.push(Interview.first) }
  end

  def show
    @interview = Interview.find(params[:id])
    reset_meta_tags_for_show(@interview)
  end

  private

  def reset_meta_tags_for_show(interview)
    prepare_meta_tags({
      title: "당신은 혁신의 편입니까? | #{@interview.name}님의 인터뷰 ",
      description: @interview.summary,
      image: @interview.image.url,
      url: request.original_url}
    )
  end
end
