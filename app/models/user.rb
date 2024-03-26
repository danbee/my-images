class User < ActiveRecord::Base
  dragonfly_accessor :avatar

  has_many :images
  has_many :albums

  def self.find_or_create_from_auth(auth)
    find_by(auth.slice(:provider, :uid)) || create_from_auth(auth)
  end

  def self.create_from_auth(auth)
    create(
      provider: auth.provider,
      uid: auth.uid,
      username: auth.info.nickname,
      name: auth.info.name,
      avatar_url: auth.info.image,
    )
  end
end
