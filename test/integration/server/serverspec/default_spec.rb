# frozen_string_literal: true

require '/tmp/kitchen/spec/spec_helper.rb'

describe package('apache2') do
  it { should be_installed }
end
