#
# Cookbook Name:: stowdotfiles
# Recipe:: default
#
# Copyright (c) 2014 Stefano Zanella, All Rights Reserved.

dotfiles_dir = node['stowdotfiles']['target_dir']

git dotfiles_dir do
  repository node['stowdotfiles']['repo_url']
  user node['current_user']
  action :checkout

  notifies :run, "execute[install_dotfiles]", :immediately
end

execute "install_dotfiles" do
  command "#{dotfiles_dir}/install"
  action :nothing
end
