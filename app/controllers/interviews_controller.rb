class InterviewsController < ApplicationController
  def index
    @interviews = []
    6.times { @interviews.push(Interview.first) }
  end

  def show
    @interview = Interview.find(params[:id])
  end
end
