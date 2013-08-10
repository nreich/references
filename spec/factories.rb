FactoryGirl.define do
  
  factory :user do
    sequence(:first_name)  {|n| "example#{n}" }
    last_name              "user"
    sequence(:email)       {|n|"test#{n}@example.com" }
    password               "foobar"
    password_confirmation  "foobar"
  end

  factory :citation do
    sequence(:title)          {|n|"Sample citation#{n}"}
    sequence(:abstract)                  {|n|"This is sample citation #{n}"}
    pubmed_url                ""
    sequence(:file_location)  {|n|"a_place_#{n}"}
    citation_type             "journal"
    publish_year              "200#{Random.rand(0..9)}"
    journal                   "Sample Journal #{Random.rand(1..20)}"
    issue                     Random.rand(1..20)
    volume                    Random.rand(1..100)
    pages                     "2-10"
    conference                "Sample Con"
    patent_assignee           "Big Pharma Co"
    patent_number             "US 2004/1234567"
    publisher                 "Overprice Publisher"
    author_list               "Smith, B.; Doe, J."
  end
  
  factory :author do
    name "Doe, J."
  end

  factory :citation_author_relationship do
    citation_id 1
    author_id    1
  end
  
  factory :comment do
    sequence(:content) {|n|"Sample comment content number #{n}"}
    association :user
    association :citation
  end
  
  factory :project do
    sequence(:name) {|n|"test Project #{n}"}
    #association :citation
  end
  
  factory :category do
    sequence(:name) {|n|"sample category #{n}"}
    #association :citation
  end

end
