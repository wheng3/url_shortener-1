require 'rails_helper'

RSpec.describe "urls/new.html.erb", type: :view do
  # pending "add some examples to (or delete) #{__FILE__}"
	it "has the shorten link" do
		render
		expect(rendered).to have_link("Shorten URL!")
	end
end
