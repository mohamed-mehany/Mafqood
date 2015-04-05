class SearchController < ApplicationController

  def searchfind
    begin
    	@results = Finding_post.search(params[:key])
    rescue
    	puts "please run rake db1:import_indicies to load the index!"
    end
    render 'index'
  end

def searchmissing
    begin
    	@results = Missing_post.search(params[:key])
    rescue
    	puts "please run rake db1:import_indicies to load the index!"
    end
    render 'index'
  end

def searchsuspect
    begin
    	@results = Suspect_post.search(params[:key])
    rescue
    	puts "please run rake db1:import_indicies to load the index!"
    end
    render 'index'
  end