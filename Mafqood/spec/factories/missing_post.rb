FactoryGirl.define do
  factory :missing_post do |f|
    f.reporter_name "Child Name"
    f.description "A Child that has been found"
    f.age 4
    f.image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'child.png')) }
    f.location_id 1
    f.gender 1
    f.special_signs "no"
    f.reporter_phone "01234567899"
    f.user_id 1
  end
end
