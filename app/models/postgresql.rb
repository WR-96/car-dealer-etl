# frozen_string_literal: true

class Postgresql < ActiveRecord::Base
  self.abstract_class = true
  establish_connection POSTGRESQL
end
