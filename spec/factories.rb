Factory.define :user do |user|
  user.first_name             "example"
  user.last_name              "user"
  user.email                  "example@ardelyx.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end

Factory.define :reference do |reference|
  reference.title           "Sample reference"
  reference.abstract        "This is just a sample reference"
  reference.pubmed_url      ""
  reference.file_location   "file://\\arx-fsv-01\global\Ardelyx_library\Ardelyx_library\000PDF\article.pdf"
  reference.reference_type  "journal"
  reference.year            2002-01-01
  reference.journal         "Sample Journal"
  reference.issue           "1"
  reference.volume          "23"
  reference.pages           "2-10"
  reference.conference      "Sample Con"
  reference.patent_assignee "Big Pharma Co"
  reference.patent_number   "US 2004/1234567"
  reference.publisher       "Overprice Publisher"
end

Factory.define :author do |author|
  author.name "that guy"
end

Factory.define :reference_author_relationship do |relationship|
  relationship.reference_id 1
  relationship.author_id    1
  relationship.author_order 1
end