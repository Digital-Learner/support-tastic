FactoryGirl.define do
  factory :ticket do
    name  "bob abrahams"
    email "bob@example.com"
    # association :department, factory: :department
    department_id 1
    subject "Google Adwords"
    detail "Adwords seem not be working on the updated site."
  end
end
