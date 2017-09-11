# Check CHEF version

require 'spec_helper'

describe command('ruby -v') do
  its (:stdout) { should match /^ruby\s2\.3\.1p.*/}
end

describe command('chef -v') do
  its (:stdout) { should match /^.*Version:\s1\.1\.16$/}
end
