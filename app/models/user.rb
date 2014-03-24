class User < ActiveRecord::Base
  def self.find_or_create_from_auth(auth)
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    if user.blank?
      User.create(provider: auth.provider,
                  uid: auth.uid,
                  username: auth.info.nickname,
                  name: auth.info.name)
    end
    user
  end
end
