class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :prepare_meta_tags, if: "request.get?"
  after_action :prepare_unobtrusive_flash

  def errors_to_flash(model)
    flash[:notice] = model.errors.full_messages.join('<br>').html_safe
  end

  def prepare_meta_tags(options={})
    set_meta_tags build_meta_options(options)
  end

  def build_meta_options(options)
    site_name = "혁신의 편"
    title = options[:title] || "당신은 혁신의 편입니까?"
    image = options[:image] || view_context.image_url('seo.png')
    url = options[:url] || root_url
    description = options[:description] || "혁신가들에게 묻고 전문가들에게 도움받아 새로운 사회시스템을 위한 정책을 만듭니다."

    {
      title:       title,
      reverse:     true,
      image:       image,
      description: description,
      keywords:    "정책, 혁신, 여시재, innovator, 혁신가, 사회적기업, 스타트업, 투자지원기관, 정책연구, 소셜벤처",
      canonical:   url,
      twitter: {
        site_name: site_name,
        site: '@parti_xyz',
        card: 'summary',
        title: title,
        description: description,
        image: image
      },
      og: {
        url: url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      }
    }
  end
end
