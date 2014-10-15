node.default['stowdotfiles']['repo_url'] = "git@github.com:#{node['current_user']}/dotfiles.git"
node.default['stowdotfiles']['target_dir'] = File.join(Dir.home(node['current_user']), "dotfiles")
