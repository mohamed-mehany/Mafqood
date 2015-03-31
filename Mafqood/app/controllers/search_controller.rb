class SearchController < ApplicationController

  def search
    begin
    	@results = Finding_post.search(params[:key])
    rescue
    	puts "please run rake db1:import_indicies to load the index!"
    end
    render 'index'
  end

def search
    begin
    	@results = Missing_post.search(params[:key])
    rescue
    	puts "please run rake db1:import_indicies to load the index!"
    end
    render 'index'
  end

def search
    begin
    	@results = Suspect_post.search(params[:key])
    rescue
    	puts "please run rake db1:import_indicies to load the index!"
    end
    render 'index'
  end