class InterviewsController < ApplicationController
  def index
    @interviews = []
    6.times { @interviews.push(Interview.first) }
  end
end
