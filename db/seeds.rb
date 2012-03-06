%w(Odin Lucas Jason Tate Nate Brian Hugh Adrian).map do |n|
  User.create! :name => n
end
