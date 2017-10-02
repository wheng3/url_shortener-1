require 'rails_helper'

RSpec.describe "urls/index.html.erb", type: :view do
#   pending "add some examples to (or delete) #{__FILE__}"
	let(:long_url1)   { 'http://www.pokemon.com' }
	let(:short_url1)  { SecureRandom.base64(7) }
	let(:long_url2)   { 'http://www.digimon.com' }
	let(:short_url2)  { SecureRandom.base64(7) }
	let(:url1)		  { Url.create(long_url: long_url1, short_url: short_url1)}
	let(:url2)		  { Url.create(long_url: long_url2, short_url: short_url2)}

	context "with 2 urls" do
		before(:each) do
			assign(:urls, [url1, url2])
		end
		it "displays a table that shows both urls' long URL and shortened URL" do
			render
			expect(rendered).to have_css("table") 
			expect(rendered).to have_content(long_url1) 
			expect(rendered).to have_content(short_url1)
			expect(rendered).to have_content(long_url2) 
			expect(rendered).to have_content(short_url2)
		end

		it "has a link that directs user to shorten link form" do
			render
			expect(rendered).to have_link("Shorten a Url!")
		end
	end
end