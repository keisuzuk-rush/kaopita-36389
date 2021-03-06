FactoryBot.define do
  factory :user do
    name                  { 'ใในใ' }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    company_number { '12345678' }
  end
end
