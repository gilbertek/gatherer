# frozen_string_literal: true

class CommentPoster
  def initialize(authentication_method:, comment:)
    @authentication_method = authentication_method
    @comment = comment
  end

  def run!
    @authentication_method.post(@comment)
  end
end

class TwitterClient
  def post(comment)
    TwitterTimelinePoster.new(comment).run!
  end
end

class FacebookClient
  def post(comment)
    FacebookNewsfeedPoster.new(comment).run!
  end
end

class TwitterTimelinePoster
end

class FacebookNewsfeedPoster
end
