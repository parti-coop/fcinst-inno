class PagesController < ApplicationController
  def about
    prepare_meta_tags({
      title: "당신은 혁신의 편입니까? | 프로젝트 소개",
      description: "혁신가들에게 묻고 전문가들에게 도움받아 새로운 사회시스템을 위한 정책을 만듭니다.",
      url: request.original_url}
    )
  end

  def conference
    prepare_meta_tags({
      title: "컨퍼런스 | 당신은 혁신의 편입니까?",
      description: "혁신 정책 컨퍼런스에 초대합니다.",
      url: request.original_url}
    )
  end

  def survey
    prepare_meta_tags({
      title: "정책 설문 | 당신은 혁신의 편입니까?",
      description: "'혁신을 키우는 10가지 정책들'에 설문해주세요.",
      url: request.original_url}
    )
  end
end
