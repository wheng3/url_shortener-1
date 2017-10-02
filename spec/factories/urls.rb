FactoryGirl.define do
  factory :url do
        long_url { "http://www.helloworld.com" }
    	short_url { SecureRandom.base64[0..8] }
  end

end
