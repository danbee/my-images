class User < ActiveRecord::Base
  has_many :images

  def self.find_or_create_from_auth(auth)
    find_by(auth.slice(:provider, :uid)) || create_from_auth(auth)
  end

  def self.create_from_auth(auth)
    create(
      provider: auth.provider,
      uid: auth.uid,
      username: auth.info.nickname,
      name: auth.info.name,
    )
  end
end
