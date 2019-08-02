# frozen_string_literal: true

class Mssql < ActiveRecord::Base
  self.abstract_class = true
  establish_connection MSSQL
end
