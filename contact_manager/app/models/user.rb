class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  def self.find_or_create_by_auth(data)
    user = find_or_create_by_provider_and_uid(provider: data['provider'],uid: data['uid'])

    if user.name != data['info']['name']
      user.name = data['info']['name']
      user.save
    end

    user
  end
end
