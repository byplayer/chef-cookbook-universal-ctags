# # encoding: utf-8

# Inspec test for recipe universal-ctags::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

BASE_DIR = '/opt/universal-ctags'.freeze

describe file(BASE_DIR) do
  it { should be_directory }
end

describe file("#{BASE_DIR}/bin") do
  it { should be_directory }
end

describe file("#{BASE_DIR}/bin/ctags") do
  it { should be_file }
  it { should be_allowed('execute') }
end

describe file("#{BASE_DIR}/bin/readtags") do
  it { should be_file }
  it { should be_allowed('execute') }
end

describe file("#{BASE_DIR}/share/man/man1") do
  it { should be_directory }
end

describe file("#{BASE_DIR}/share/man/man1/ctags.1") do
  it { should be_file }
end

describe file("#{BASE_DIR}/share/man/man7") do
  it { should be_directory }
end

describe file("#{BASE_DIR}/share/man/man7//ctags-incompatibilities.7") do
  it { should be_file }
end

describe file("#{BASE_DIR}/share/man/man7//ctags-optlib.7") do
  it { should be_file }
end

describe bash("#{BASE_DIR}/bin/ctags --version") do
  its('stdout') { should match /e522743d873abcfa4997fe6bad5f5cf634f57c6d/ }
  its('exit_status') { should eq 0 }
end
