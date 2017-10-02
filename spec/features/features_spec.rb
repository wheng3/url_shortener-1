require 'rails_helper'

describe "Able to click on a link that leads to the shortening form", type: :feature do
  it "redirects to new" do
    visit root_path
    click_link "Shorten a Url!"
    expect(current_path).to eq(new_url_path)
  end
end


describe "user clicks the long_url", type: :feature do
  before :each do
    @url = FactoryGirl.create(:url)
  end

  it "redirects to root page" do
    visit root_path
    click_link "http://www.helloworld.com"

    expect(current_path).to eq(url_path(@url.id))
    expect(page.body).to have_content(@url.long_url)
    expect(page.body).to have_content(@url.short_url)

  end
end

describe "Shorten a link", type: :feature do
  it "redirects to new" do
    visit new_url_path
    fill_in "long_url", with: "http://nextacademy.com"
    click_button "Shorten URL!"

    expect(current_path).to eq(urls_path)
    expect(page.body).to have_content("http://nextacademy.com")
  end
end