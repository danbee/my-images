class User < ActiveRecord::Base
  dragonfly_accessor :avatar

  def self.find_or_create_from_auth(auth)
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    if user.blank?
      user = User.create(provider: auth.provider,
                  uid: auth.uid,
                  username: auth.info.nickname,
                  name: auth.info.name,
                  avatar_url: auth.info.image)
    end
    user
  end
end
