class UrlsController < ApplicationController
	def index
		@url = Url.new
		@urls = Url.all
	end

	def show
		@url = Url.find(params[:id])
	end

	def new
  		@url = Url.new
	end

	def create
		@saved = false
		@url = Url.new(url_params)
		@url.shorten
		if @url.save
		  @saved = true
		  redirect_to urls_path
		else
		  @errors = "Invalid url"
		  render 'urls/new'
		end
	end

	def destroy
		@url = Url.find(params[:id])
		@url.destroy
		redirect_to urls_path
	end

	def short
		url = Url.find(params[:id])
		long_url = url.long_url
		redirect_to long_url
	end
end

private 
def url_params
    params.require(:url).permit(:long_url)
end