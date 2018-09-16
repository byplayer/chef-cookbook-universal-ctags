#
# Cookbook:: universal-ctags
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'universal-ctags::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '18.04')
      runner.converge(described_recipe)
    end

    before do
      stub_command('/opt/universal-ctags/bin/ctags --version | grep e522743d873abcfa4997fe6bad5f5cf634f57c6d').and_return(false)
      stub_command("test -f #{Chef::Config['file_cache_path']}/e522743d873abcfa4997fe6bad5f5cf634f57c6d.tar.gz").and_return(false)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
