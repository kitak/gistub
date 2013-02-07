class User < ActiveRecord::Base

  attr_accessible :nickname,
                  :omniauth_provider,
                  :omniauth_uid

  validates :omniauth_provider, :presence => true
  validates :omniauth_uid, :presence => true

  has_many :gists
  has_many :comments

  class << self
    def create_with_omniauth(auth)
      create! do |user|
        user.omniauth_provider = auth["provider"]
        user.omniauth_uid = auth["uid"]
        user.nickname = nil
      end
    end

    def inct_student?(auth)
      /\A.+\@gm\.ishikawa\-nct\.ac\.jp\Z/ =~ "s113105@gm.ishikawa-nct.ac.jp" 
    end
  end

end
