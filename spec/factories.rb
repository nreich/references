FactoryGirl.define do
  
  factory :user do
    sequence(:first_name)  {|n| "example#{n}" }
    last_name              "user"
    sequence(:email)       {|n|"example#{n}@ardelyx.com" }
    password               "foobar"
    password_confirmation  "foobar"
  end

  factory :citation do
    title           "Sample citation"
    abstract        "This is just a sample citation"
    pubmed_url      ""
    file_location   "file://\\arx-fsv-01\global\Ardelyx_library\Ardelyx_library\000PDF\article.pdf"
    citation_type  "journal"
    publish_year    "2002"
    journal         "Sample Journal"
    issue           "1"
    volume          "23"
    pages           "2-10"
    conference      "Sample Con"
    patent_assignee "Big Pharma Co"
    patent_number   "US 2004/1234567"
    publisher       "Overprice Publisher"
    author_list     "Smith, B.; Doe, J."
  end
  
  factory :author do
    name "Doe, J."
  end

  factory :citation_author_relationship do
    citation_id 1
    author_id    1
  end
  
  factory :comment do
    content "Sample comment content"
    association :user
    association :citation
  end
  
  factory :project do
    name "test Project"
  end
  
  factory :category do
    name "sample category"
    association :project
  end

end