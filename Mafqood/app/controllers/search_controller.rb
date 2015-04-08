

class SearchController < ApplicationController
  def search
    @paramss = ActionView::Base.full_sanitizer.sanitize(params[:query])
    if @paramss.length > 0
      @paramss = '%' << @paramss << '%'
      @posts = MissingPost.where('(location LIKE ?) OR (age LIKE ?) OR (reporter_name LIKE ?) OR (locations LIKE ?) OR (gender LIKE ?)',
                                @paramss, @paramss, @paramss, @paramss, @paramss)
      @posts = FindingPost.where('(location LIKE ?) OR (age LIKE ?) OR (reporter_name LIKE ?) OR (locations LIKE ?) OR (gender LIKE ?)',
                                @paramss, @paramss, @paramss, @paramss, @paramss)
      @posts = SuspectPost.where('(location LIKE ?) OR (age LIKE ?) OR (locations LIKE ?) OR (gender LIKE ?)',
                                @paramss, @paramss, @paramss, @paramss)
    else
      redirect_to(:back)
    end
  end

  private

  # Never trust parameters from the scary internet
  def search_params
    params.permit(:query)
  end
end




#   def searchfind
#     begin
#         @results = FindingPost.search(params[:key])
#     rescue
#         puts "please run rake db1:import_indicies to load the index!"
#     end
#     render 'index'
#   end

# def searchmissing
#     begin
#         @results = MissingPost.search(params[:key])
#     rescue
#         puts "please run rake db1:import_indicies to load the index!"
#     end
#     render 'index'
#   end

# def searchsuspect
#     begin
#         @results = SuspectPost.search(params[:key])
#     rescue
#         puts "please run rake db1:import_indicies to load the index!"
#     end
#     render 'index'
#   end
# end
