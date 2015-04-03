class WidgetsController < InheritedResources::Base

  private

    def widget_params
      params.require(:widget).permit(:name)
    end
end

