ActiveAdmin.register SuspectPostReport do
  menu parent: "Reported Posts", label: "Suspect Posts Reports"

  config.batch_actions = false

  scope :fake 
  scope :spam 
  scope :duplicate 

  index do
    column "ID", :id
    column "Post ID", :suspect_post_id
    column "Report Type", :kind
    column :created_at
    actions 
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
