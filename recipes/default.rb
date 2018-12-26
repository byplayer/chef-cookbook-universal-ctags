#
# Cookbook:: universal-ctags
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
pkgs = %w(autotools-dev autoconf pkg-config python-docutils)
pkgs.each do |pkg|
  package pkg
end

url = "https://github.com/universal-ctags/ctags/archive/#{node['universal-ctags']['version']}.tar.gz"

basename = File.basename(url)

remote_file "#{Chef::Config['file_cache_path']}/#{basename}" do
  source    url
  mode      00644
  checksum  node['universal-ctags']['checksum']
  not_if    "test -f #{Chef::Config['file_cache_path']}/#{basename}"
end

dir_name = "ctags-#{node['universal-ctags']['version']}"

execute "build universal-ctags: #{basename}" do
  cwd Chef::Config['file_cache_path']
  command <<-COMMAND
    if [ -d #{node['universal-ctags']['prefix']} ]; then
      rm -r #{node['universal-ctags']['prefix']}
    fi

    if [ -d #{dir_name} ]; then
      rm -r #{dir_name}
    fi

    tar xzf #{basename}
    cd #{dir_name}
    ./autogen.sh
    sed -i -e "s/PACKAGE_VERSION='0.0.0'/PACKAGE_VERSION='#{node['universal-ctags']['version']}'/g" configure
    ./configure --prefix=#{node['universal-ctags']['prefix']} #{node['universal-ctags']['congigure_opt']}
    make
    make install
  COMMAND
  not_if "#{node['universal-ctags']['prefix']}/bin/ctags --version | grep #{node['universal-ctags']['version']}"
end
