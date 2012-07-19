FactoryGirl.define do
  
  factory :user do
    first_name             "example"
    last_name              "user"
    email                  "example@ardelyx.com"
    password               "foobar"
    password_confirmation  "foobar"
  end

  factory :reference do
    title           "Sample reference"
    abstract        "This is just a sample reference"
    pubmed_url      ""
    file_location   "file://\\arx-fsv-01\global\Ardelyx_library\Ardelyx_library\000PDF\article.pdf"
    reference_type  "journal"
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

  factory :reference_author_relationship do
    reference_id 1
    author_id    1
  end

end