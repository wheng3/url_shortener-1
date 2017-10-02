class Url < ApplicationRecord
	before_create :shorten
	validates :short_url, uniqueness: true, presence: true
	validates :long_url, presence: true
	validates_format_of :long_url, :with => URI::regexp(%w(http https))

	def shorten
		range = [*'0'..'9',*'A'..'Z',*'a'..'z']
		shortened_string = Array.new(7){ range.sample }.join
		if self.short_url.nil?
			self.short_url = shortened_string
		end
	end

	def self.retrieve_short_url(long_url)
		url = Url.find_by(long_url: long_url)
		if url.nil?
			return nil
		else
			return url.short_url
		end
	end
end