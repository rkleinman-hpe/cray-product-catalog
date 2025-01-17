# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

- Remove redundant license/copyright info from README

## [1.4.23] - 2022-01-27

### Changed

- Restrict the changelog and artifact pr workflows to not run on gitflow and
  dependency update PRs
- dependabot update python dep attrs from 21.2.0 to 21.4.0

## [1.4.22] - 2022-01-27

### Changed

- Fixed gitflow mergeback workflow to use correct app key/id

## [1.4.21] - 2022-01-26

### Changed

- Let PR artifacts deploy workflow time out if it doesn't find a matching build

## [1.4.20] - 2022-01-26

### Changed

- Update gitflow mergeback workflow to use continuous update strategy

## [1.4.19] - 2022-01-26

### Added

- Add gitflow mergeback workflow

## [1.4.18] - 2022-01-26

### Added

- Allow Github releases to be updated when rebuilding tagged releases
  (for rebuilds to fix CVEs, etc)

## [1.4.17] - 2022-01-26

### Changed

- Fix release note rendering for stable releases

## [1.4.15] - 2022-01-25

### Changed

- Update to use new "no ref needed" reusable workflow

## [1.4.14] - 2022-01-21

### Added

- Update CSM manifest workflow
- Release workflow to build artifacts and create GH releases on tags

### Changed

- Build artifacts workflow is now reusable, no longer builds on tag events

### Removed

- Removed old and unused release prep workflows

## [1.4.13] - 2022-01-20

### Added

- Add changelog checker workflow

## [1.4.12] - 2022-01-19

-   Test release with only CHANGELOG updates

## [1.4.11] - 2022-01-19

### Added

-   Added workflows for finishing gitflow release and merging back to develop

## [1.4.10] - 2022-01-13

### Changed

- Only build artifacts on push events, not PRs. Change PR comments to point to the individual commit, not the overall PR.

## [1.4.6] - 2022-01-07

### Changed

-   Fix the draft release PR workflow to add labels

## [1.4.5] - 2022-01-07

### Added

- Add workflows for creating PRs for a draft release, and tagging and release creation when a release branch is merged to master.

## [1.4.4] - 2022-01-07

### Added

- Build docker image, helm chart, python module with GH actions (CASMCMS-7698)

## [1.4.3] - 2022-01-05

### Changed

- Change default behavior to stop setting "active" key unless `SET_ACTIVE_VERSION` variable is given.

## 1.4.2 - 2021-12-01

### Changed

- Updated README to reflect versioning change in v1.4.1.

## 1.4.1 - 2021-12-01

### Changed

- Changed GitVersion.yml to ignore previous CSM release branches

## 1.4.0 - 2021-11-29

### Added

- Build docker image with CSM-provided build-scan-sign GH action
- Add GitVersion.yml for automatic git versioning using Gitflow
- Pull python requirements from PyPI, not arti.dev.cray.com to enable GH actions builds

## 1.3.1 - 2021-11-19

### Added

- Added pull request template
- Added Chart lint, test, scan action

### Changed

- Conformed chart to CASM-2670 specifications (CASMCMS-7619)

## 1.2.71 - 2017-11-15

### Added

- Included cray-product-catalog python module
- Introduce new catalog entry delete functionality

### Changed

- Updated repo to Gitflow branching strategy; develop branch now base branch
- Change default reviewers to CMS-core-product-support

[Unreleased]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.23...HEAD

[1.4.23]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.22...1.4.23

[1.4.22]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.21...1.4.22

[1.4.21]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.20...1.4.21

[1.4.20]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.19...1.4.20

[1.4.19]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.18...1.4.19

[1.4.18]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.17...1.4.18

[1.4.17]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.15...1.4.17

[1.4.15]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.14...1.4.15

[1.4.14]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.13...1.4.14

[1.4.13]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.12...1.4.13

[1.4.12]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.11...1.4.12

[1.4.11]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.10...1.4.11

[1.4.10]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.6...1.4.10

[1.4.6]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.5...1.4.6

[1.4.5]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.4...1.4.5

[1.4.4]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.3...1.4.4

[1.4.3]: https://github.com/Cray-HPE/cray-product-catalog/compare/1.4.2...1.4.3
