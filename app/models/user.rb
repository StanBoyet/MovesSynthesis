class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :omniauthable, :omniauth_providers => [:moves]

  def self.from_omniauth(auth)
    byebug
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.platform = auth.extra.raw_info.profile.platform
      user.from_date = auth.info.firstDate
      user.access_token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
    end
  end

end
