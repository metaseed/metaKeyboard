# Release Notes

## 0.3.3 (Oct 24, 2017)

A lot of improvements for vagrant completions (thanks to @Andegawen) and a few bugfixes for `yarn`, `ssh` and `git`.

  * `af5f6d1` [git] Fix git main worktree detection (#95)
  * `032ff0c` [vagrant] Close Vagrantfile after usage (#93)
  * `757c096` [vagrant] Enhance regex for finding provision names (#91)
  * `84884db` [vagrant] Vagrant list provisions on `--provision-with`  (#88)
  * `59055f7` [vagrant] add `global-status` and `snapshot` commands  (#86)
  * `e4d562a` [ssh] Improves pattern matching for searching hosts (#85)
  * `34d3c0c` [common] Make luacheck happy (#83)
  * `f1898a0` [git] Support completing files for `git diff` (#82)
  * `c288656` [yarn] Suggest installed executables for yarn run
  * `162d402` [common] Fix arguments clobbering 'table' class
  * `a552d8c` [chore] Remove trailing whitespace to pass CI (#70)
  * `3f635f9` [yarn] Upgrade commands for Yarn v0.17.8 (#69)
  * `b76867a` [git] Add support for fetch --all (#68)
  * `8edbf28` Add completions for angular-cli (#67)
  * `9cc940c` [common] Enable luacheck
  * `a369227` [common] Configure CI
  * `0714e67` [common] Add tests for funclib and color modules
  * `a4c83df` [test] Add test harness and instructions
  * `834dbf3` [git] Display git push destination in prompt

## 0.3.2 (Nov 6, 2016)

This release adds completions for `yarn` package manager and a bunch of minor improvements and bugfixes

  * `9789bc8` [npm] Improve prompt output in some situations
  * `795f6a9` [npm] Resolve lua error when package.json is empty
  * `fea1e21` [git] Add completions for 'git difftool'
  * `f840079` Add completions for Yarn v0.14
  * `8400a8b` [git] Add basic completions for cherry-pick
  * `f411878` [git] Complete branches in `git reset`
  * `83c71e1` [vagrant] Fix help parser for Vagrant completions
  * `2845966` [npm] Add version flag
  * `1e3931f` [git] '--prune' option for 'fetch'
  * `cc51616` [cordova] Add statusbar to core plugins


## 0.3.1 (June 11, 2016)

This release adds a few fixes and small improvements for `npm` prompt and completions

  * `f2e335d` [npm] Do not query global modules when completing FS paths in 'npm link'
  * `c59c0d9` [npm] Improve package.json handling for npm prompt
  * `6edf054` [npm] Do not fetch package name and version for private packages
  * `23d7599` [npm] Improve package.json parsing

## 0.3.0 (May 8, 2016)

This release adds support for completions inside of git submodules and a completions for a couple of new commands (`ssh` and `nvm`)

  * `21464d1` [ssh] Refactor hosts search logic
  * `26f4f99` [ssh] Add ssh completion from known_hosts file
  * `9a4d308` [nvm] Add basic nvm completions
  * `3c25f96` [git] Housekeeping
  * `b39e617` [git] Fix fetch --tags completion
  * `99140d1` [git] Allow multiple branches for git branch -d
  * `087874b` [cordova] Add a couple of new completions for coho
  * `e4cf69d` [cordova] Remove old core plugin IDs from 'plugin add/rm'
  * `a14af9c` [git] Adds basic support for submodules
  * `e2467f6` [choco] Fix chocolatey non-meta packages listing
  * `9540aa6` [npm] Adds 'npm outdated' flags
  * `91cef45` [ssh] Adds ssh autocomplete script

## 0.2.2 (Dec 10, 2015)

Another bugfix release. Multiple small fixes for git inclded.

  * `83ef129` [git] Fixes failure when trying to complete git commmands outside of repo
  * `7f4c223` [git] add merge strategies and options parsers to pull/rebase/checkout
  * `faf92f2` [git] Distinguish real and suggestes branch names
  * `ad24a7f` [git] Adds "core.trustctime" to available options
  * `e6921a3` [npm] Query npm config lazily (only when required by completions)
  * `03bec42` [git] Adds completions for `git remote update`
  * `2ea5f33` [git] Close packed-refs after reading
  * `e92d5a2` [git] Complete non-checked local branches based on remote ones.
  * `a68ed47` [git] List remote branches based on packed-refs file.

## 0.2.1 (Oct 21, 2015)

Minor bugfix release for 0.2.0. This release mostly fixes various bugs, found after 0.2.0 is out.

  * `1cea322` [npm] Fix npm prompt failure when parsing malformed package.json
  * `cfaf17d` [git] Remove ugly error message when trying to complete git aliases without git in PATH
  * `d2ac838` [git] Fixes broken 'git add'. This closes #34
  * `e09a9b0` [git] Adds user.name and user.email to known options
  * `6999fdf` [npm] Fixes issue with completing 'npm run' in non-npm directory. This fixes #33
  * `46fd830` [npm] Handle package scripts with quotes properly
  * `c20e421` [common] Merge npm prompt into regular 'npm' module
  * `4050dc9` [npm] Complete global packages and local dirs for npm link

## 0.2.0 (Oct 05, 2015)

#### Git

  * `b9a80e8` [git] Complete remotes using gitconfig
  * `c8e1ac5` [git] Adds local branches to git checkout (was broken by 751ed21)
  * `2f1ea08` [git] Improves branches completion for git push
  * `751ed21` [git] Fixes checkout completion to list branches correctly.
  * `33a086a` [git] Adds completion for git config
  * `822e92e` [git] Adds git stash completion
  * `b9be7d8` [git] Adds completion of nested branches (prefix/branch)
  * `c7e4f3d` [git] Refactors git completions logic
  * `5c589fd` [git] Fixes matchers usage
  * `9eb775f` [git] Refactors git completions logic, adds git reset completion
  * `94b6a71` [git] Adds alias autocompletion
  * `7f1ea3b` [git] Adds autcompletion for remote branches
  * `579ff78` [git] Adds git-svn autocompletion
  * `dea2c04` [git] Adds completions for git remote command
  * `f692cd4` [git] Removes unexistent commands like rebase--*

#### Chocolatey

  * `e6efea2` [choco] Adds feature parser
  * `2fbb271` [choco] Updates choco completions according to v0.9.9

#### Cordova

  * `524b88e` [coho] Adds more commands
  * `57762ef` [cordova] Adds --browserify flag
  * `a1caddb` [coho] Complete repo names
  * `2258ff9` [coho] Adds merge-pr command
  * `04d46e9` [coho] Adds npm-link

#### NPM

  * `f9af8fe` [npm] Adds support for 'npm publish'
  * `5875a6e` [npm] Fixes module loading when Node is not installed
  * `7132894` [npm] Adds npm update and npm cache completions

#### Common

  * `3e4c88d` [common] Refactor to reuse table wrapper where possible
  * `f2ba478` [common] Fixes problem with dirs matchers
  * `7869df4` [common] Implements tables wrapper
  * `eafc11b` [common] Removes unwanted . and .. directories in some completions
  * `3f8cd6b` [common] Adds development/contribution notes
  * `7920243` [common] Slightly updates funclib, adds luadoc
  * `f66b0c2` Remove outdated info about extended branch.
  * `3c023d3` Fix for Nil needle value when calling clink.is_match()
  * `2491d21` [common] Updates completions to depend on shared modules
  * `d91ba44` [common] Factors various util functions into modules system
  * `1b48a48` [common] Merges extended completions into master
  * `eaefce3` [common] Adds link to Clink to README

## 0.1.0 (Mar 20, 2015)

Initial release. No changelog until this moment.
