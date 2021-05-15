# Cray Product Catalog

## Versioning
We use [SemVer](http://semver.org/) for versioning. See the `.version` file in
the repository root for the current version. Please update that version when
making changes. Other files either read the version string from this file or
have this version string written to them at build time using the 
[update_versions.sh](update_versions.sh) script, based on the information in the 
[update_versions.conf](update_versions.conf) file.

## Contributing

CMS folks, make a branch. Others, make a fork.

## Built With

* Alpine Linux
* Python 3
* Python Requests
* Kubernetes Python Client
* Docker
* Good intentions

## Blamelog

* _0.1.0_ - initial release for Shasta 1.4, addition to CSM product stream - David Laine (david.laine@hpe.com)
* _0.0.1_ - initial implementation - Randy Kleinman (randy.kleinman@hpe.com)

## Copyright and License
This project is copyrighted by Hewlett Packard Enterprise Development LP and is under the MIT
license. See the [LICENSE](LICENSE) file for details.

When making any modifications to a file that has a Cray/HPE copyright header, that header
must be updated to include the current year.

When creating any new files in this repo, if they contain source code, they must have
the HPE copyright and license text in their header, unless the file is covered under
someone else's copyright/license (in which case that should be in the header). For this
purpose, source code files include Dockerfiles, Ansible files, RPM spec files, and shell
scripts. It does **not** include Jenkinsfiles, OpenAPI/Swagger specs, or READMEs.

When in doubt, provided the file is not covered under someone else's copyright or license, then
it does not hurt to add ours to the header.
