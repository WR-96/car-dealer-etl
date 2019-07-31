# frozen_string_literal: true

class Mariadb < ActiveRecord::Base
  self.abstract_class = true
  establish_connection MARIADB
end
