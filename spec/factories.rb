Factory.define :user do |user|
  user.first_name             "example"
  user.last_name              "user"
  user.email                  "example@ardelyx.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end