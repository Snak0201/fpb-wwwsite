module Admins
  module ArticlesHelper
    def publish_status(published_at)
      return '非公開' if published_at.nil?

      '公開'
    end
  end
end
