FactoryGirl.define do
  factory :spammer do |s|
    s.id 1
    s.user_id 1
    s.user_ip "127.0.0.1"
    s.kind "verified"
  end
end
