require 'spec_helper'
# require 'serverspec'

describe package('curl') do
    it { should be_installed }
end