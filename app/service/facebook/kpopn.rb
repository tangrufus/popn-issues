module Facebook
  class Kpopn < Facebook::Base
    def initialize(post:)
      super(message: post.facebook_message,
            link: post.link,
            token: Rails.application.secrets.kpopn_fb_page_token,
            post: post
      )
    end
  end
end
