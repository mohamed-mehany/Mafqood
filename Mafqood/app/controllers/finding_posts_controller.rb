class FindingPostsController < ApplicationController
  
  def new
   @finding = FindingPost.new
  end
  
  def create
    if (current_user)
    	@finding = FindingPost.new(finding_params)
    	@finding.user = current_user
      if @finding.save
        redirect_to @finding, notice: "Your new post have been created successfully!"
      else
        flash[:alert] = @finding.errors.full_messages
        render 'new'
	    end
    end
  end
  

  protected

  def finding_params
    params.require(:finding_post).permit(:name,:contact_info,:description,:age,:special_signs,:image,:location,:gender)
  end

end
