require 'spec_helper'

describe User do
  describe "assocations" do
    it {should have_many(:questions)}
  end
end