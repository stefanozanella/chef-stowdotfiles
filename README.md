# stowdotfiles Cookbook

This cookbook allows to manage a git-backed dotfiles directory that uses stow
to populate the actual home directory. An example of such a repo can be found
[here](https://github.com/stefanozanella/dotfiles) (yes, that's my own one, and
 yes, that's why this cookbook exists :).

# Usage

This cookbook is mainly meant to be used in conjunction with Kitchenplan. In
this case, all you need to do is to include the cookbook in your `Cheffile`:

```
cookbook "stowdotfiles"
```

Then you can include the default recipe in the user's yml config:
```
recipes:
  - stowdotfiles::default
```

You can then configure the URL of the base repository to be checked out and the
path of the target directory where the repo will be cloned:
```
attributes:
  stowdotfiles:
    repo_url: git@github.com/stefanozanella/dotfiles.git
    target_dir: /Users/stefano/dotfiles
```

The recipe will then checkout the repo at the specified target directory, and run the install script contained inside it, effectively putting your dotfiles in place.

If no attribute is specified, the recipe will try to clone from `git@github.com/<current user>/dotfiles` into `~/dotfiles`.

## Note about syncing

By default, this cookbook does not attempt neither to sync the repo, nor to install an (possibly) updated version of the
dotfiles. This is by design, since usually, when you have your dotfiles in place, the workflow turns out to be more manual (while you might still want to update other stuff with Kitchenplan). This might change (read: be more flexible) in the
future.
