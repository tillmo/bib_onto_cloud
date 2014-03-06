class User < ActiveRecord::Base
  attr_accessible :fk_groups, :login, :passwort, :realname, :username
end
