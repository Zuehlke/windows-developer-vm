#
# Cookbook:: vm
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

windows_package 'Ruby-2.3.1' do
  source 'http://10.48.29.5/depot/installers/rubyinstaller-2.3.1-x64.exe'
  options '/verysilent /dir="c:\Progra~1\ruby-2.3.1" /tasks="assocfiles,modpath"'
  action :install
end

gem_package 'serverspec' do
  action :install
end

reboot 'Reboot after installation' do
  delay_mins 3
  reason 'Required to set up environment variables'
  action :request_reboot
end