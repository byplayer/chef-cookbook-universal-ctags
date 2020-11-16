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

describe file("#{BASE_DIR}/share/man/man7/ctags-incompatibilities.7") do
  it { should be_file }
end

describe file("#{BASE_DIR}/share/man/man7/ctags-optlib.7") do
  it { should be_file }
end

describe bash("#{BASE_DIR}/bin/ctags --version") do
  its('stdout') { should match(/01b9fc8669928ff7e677f77ff3df3a6f84a02a16/) }
  its('exit_status') { should eq 0 }
end

describe bash("#{BASE_DIR}/bin/ctags --version") do
  its('stdout') { should match(/5\.9\.0/) }
  its('exit_status') { should eq 0 }
end
