BASE_DIR = '/opt/params_test/universal-ctags'.freeze

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
  its('stdout') { should match(/4729393a8d9c5c813de53fda90f10e1cbb27cd4d/) }
  its('exit_status') { should eq 0 }
end

describe bash("#{BASE_DIR}/bin/ctags --version") do
  its('stdout') { should match(/5\.9\.0/) }
  its('exit_status') { should eq 0 }
end

# TODO: compile opetion test
