class SearchController < ApplicationController

  def searchfind
    begin
    	@results = FindingPost.search(params[:key])
    rescue
    	puts "please run rake db1:import_indicies to load the index!"
    end
    render 'index'
  end

def searchmissing
    begin
    	@results = MissingPost.search(params[:key])
    rescue
    	puts "please run rake db1:import_indicies to load the index!"
    end
    render 'index'
  end

def searchsuspect
    begin
    	@results = SuspectPost.search(params[:key])
    rescue
    	puts "please run rake db1:import_indicies to load the index!"
    end
    render 'index'
  end
end