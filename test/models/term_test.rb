# == Schema Information
#
# Table name: terms
#
#  id         :integer          not null, primary key
#  slug       :string           not null
#  host       :string           not null
#  taxonomy   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_terms_on_host_and_slug_and_taxonomy  (host,slug,taxonomy) UNIQUE
#

require 'test_helper'

class TermTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end