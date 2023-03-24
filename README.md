# GitHubActionsDemo

A demo repo to create GitHub Action/script to automate the process of creating a new GitHub release based on the latest entry in the CHANGELOG.md file

Quickstart for [GitHub Actions](https://docs.github.com/en/actions/quickstart "this").

## Requirements:

- GitHub Action that runs when a new Tag is created
- Grab the latest ChangeLog entry from the CHANGELOG.md file
- Use the Tag name as the title
- Use the remaining lines of the ChangeLog entry as the description text
- Create a new Release associated with the new Tag, title and description

## Usage

A `create-tag.sh` script was created to automate Tag creation. This script needs to be called for a specific version to create release.

For the given CHANGELOG.md file content as below.

`## [1.0.0] - 2023-03-25`
`### Added`
`- New feature E`
`- New feature R`
`- New feature C`
`### Changed`
`- Refactored module A`
`- Refactored module N`
`### Fixed`
`- Fixed module D`
`- Fixed module M`
`- Fixed module N`

All you have to do is run `./.github/workflows/create-tag.sh 1.0.0`, then it creates a new **Release 1.0.0** as shown below.

**1.0.0 Latest**

- New feature E
- New feature R
- New feature C
- Refactored module A
- Refactored module N
- Fixed module D
- Fixed module M
- Fixed module N

The aforementioned release can be checked from [this](https://github.com/dumanqm/GitHubActionsDemo/releases/tag/1.0.0 "this") link.