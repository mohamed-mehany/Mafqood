FactoryGirl.define do
  factory :missing_post do |f|
    f.gender true
    f.age 2
    f.location "Child Location"
    f.reporter_name "reporter_name"
    f.reporter_phone "01111111111"
    f.status false
  end
end