# frozen_string_literal: true

require_relative 'account'
require_relative 'exceptions'
require_relative 'statement'
require_relative 'transaction'
require_relative 'menu'

m = Menu.new.start
exit
