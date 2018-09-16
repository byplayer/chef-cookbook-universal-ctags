#
# Cookbook:: universal-ctags
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
pkgs = %w{autotools-dev autoconf pkg-config python-docutils}
pkgs.each do |pkg|
  package pkg
end

basename = File.basename(node['universal-ctags']['url'])

remote_file "#{Chef::Config['file_cache_path']}/#{basename}" do
  source    node['universal-ctags']['url']
  mode      00644
  checksum  node['universal-ctags']['checksum']
  not_if "test -f #{Chef::Config['file_cache_path']}/#{basename}"
end

execute 'build universal-ctags: #{basename}' do
  cwd Chef::Config['file_cache_path']
  command <<-COMMAND
    if [ -d #{node['universal-ctags']['prefix']} ]; then
      rm -r #{node['universal-ctags']['prefix']}
    fi

    if [ -d #{node['universal-ctags']['dir_name']} ]; then
      rm -r #{node['universal-ctags']['dir_name']}
    fi

    tar xzf #{basename}
    cd #{node['universal-ctags']['dir_name']}
    ./autogen.sh
    sed -i -e "s/PACKAGE_VERSION='0.0.0'/PACKAGE_VERSION='#{node['universal-ctags']['version']}'/g" configure
    ./configure --prefix=#{node['universal-ctags']['prefix']} #{node['universal-ctags']['congigure_opt']}
    make
    make install
  COMMAND
  not_if "#{node['universal-ctags']['prefix']}/bin/ctags --version | grep #{node['universal-ctags']['version']}"
end
