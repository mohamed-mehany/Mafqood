FactoryGirl.define do
  factory :finding_post do |f|
    f.name "Child Name"
    f.description "A Child that has been found"
    f.age 4
    f.image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'child.png')) }
    f.location_id 1
    f.gender 1
    f.contact_info "01111111111"
    f.status false
    f.user_id 1
  end
end
