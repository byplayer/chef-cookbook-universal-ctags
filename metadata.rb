name 'universal-ctags'
maintainer 'byplayer'
maintainer_email 'byplayer100@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures universal-ctags'
long_description 'Installs/Configures universal-ctags'
version '2.0.0'
chef_version '>= 12.14' if respond_to?(:chef_version)

%w[mac_os_x ubuntu].each do |os|
  supports os
end

issues_url 'https://github.com/byplayer/chef-cookbook-universal-ctags/issues'
source_url 'https://github.com/byplayer/chef-cookbook-universal-ctags'
