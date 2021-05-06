#
# Cookbook:: universal-ctags
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

pkgs = []

if platform_family?('debian', 'ubuntu')
  pkgs = %w[autotools-dev autoconf make gcc pkg-config python3-docutils]
elsif platform_family?('mac_os_x')
  pkgs = %w[autoconf gcc]
end

pkgs.each do |pkg|
  package pkg
end

url = "https://github.com/universal-ctags/ctags/archive/#{node['universal-ctags']['version']}.tar.gz"

basename = File.basename(url)

remote_file "#{Chef::Config['file_cache_path']}/#{basename}" do
  source    url
  mode      0o0644
  checksum  node['universal-ctags']['checksum']
  not_if    "test -f #{Chef::Config['file_cache_path']}/#{basename}"
end

dir_name = "ctags-#{node['universal-ctags']['version']}"

bash "build universal-ctags: #{basename}" do
  cwd Chef::Config['file_cache_path']
  environment({ 'CONFIG_SHELL' => '/bin/bash' })
  code <<-COMMAND
    if [ -d #{node['universal-ctags']['prefix']} ]; then
      rm -r #{node['universal-ctags']['prefix']}
    fi

    if [ -d #{dir_name} ]; then
      rm -r #{dir_name}
    fi

    tar xzf #{basename}
    cd #{dir_name}
    ./autogen.sh
    sed -r -i -e "s/PACKAGE_VERSION='([0-9\.]+)'/PACKAGE_VERSION='\\1 #{node['universal-ctags']['version']}'/g" configure
    ./configure --prefix=#{node['universal-ctags']['prefix']} #{node['universal-ctags']['congigure_opt']}
    cat config.log
    make
    make install
  COMMAND
  not_if "#{node['universal-ctags']['prefix']}/bin/ctags --version | grep #{node['universal-ctags']['version']}"
end
