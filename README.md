# Cray Product Catalog

This repository contains the Docker image definition for the cray-product-catalog
image. This image provides a script that uploads the contents of a yaml file to
a product catalog entry, which serves as a kubernetes config map.

At minimum, the `catalog_update.py` script takes a `PRODUCT` and
`PRODUCT_VERSION` and applies the content of a file denoted by `YAML_CONTENT`
file as follows:

```yaml
{PRODUCT}:
  {PRODUCT_VERSION}:
    {content of yaml file (in YAML_CONTENT)}
```

The product catalog is a software inventory of sorts, and allows for system
users to view a product and its associated versions and version metadata that
have been _installed_ on the system.

The cray-product-catalog image is assumed to be running in the Shasta
Kubernetes cluster by an actor that has permissions to read and update config
maps in the namespace that is configured.

## Getting Started

The main use case for cray-product-catalog is for a product to add install-time
information and metadata to the cray-product-catalog config map located in the
services namespace via a Kubernetes job as part of a Helm chart. The image
could also be used via podman on an NCN, but this has not been tested.

## Example Usage

### Helm Chart

Two seminal examples of using cray-product-catalog are the `cray-import-config`
and `cray-import-kiwi-recipe-image` base charts. Review the values files and
Kubernetes job template to see cray-product-catalog in action.

* [cray-import-config](https://github.com/Cray-HPE/cray-product-install-charts/tree/master/charts/cray-import-config)
* [cray-import-kiwi-recipe-image](https://github.com/Cray-HPE/cray-product-install-charts/tree/master/charts/cray-import-kiwi-recipe-image)

### Podman on NCN

To create an entry in the config map for an "example" product with version
1.2.3, you can use podman on a Kubernetes worker/master node. Be sure to mount
the Kubernetes config file into the running container as well as the
`YAML_CONTENT`.

```bash
ncn-w001:~/ # podman run --rm --name example-cpc --network podman-cni-config \
    -e PRODUCT=example \
    -e PRODUCT_VERSION=1.2.3 \
    -e YAML_CONTENT=/results/example.yaml \
    -e KUBECONFIG=/.kube/admin.conf \
    -v /etc/kubernetes:/.kube:ro \
    -v ${PWD}:/results:ro \
    arti.dev.cray.com/csm-docker-stable-local/cray-product-catalog-update:0.1.0-20201215000547_74d64e3
Updating config_map=cray-product-catalog in namespace=services for product/version=example/1.2.3
Retrieving content from /results/example.yaml
Resting 3s before reading ConfigMap
Product=example does not exist; will update
ConfigMap update attempt=1
Resting 2s before reading ConfigMap
ConfigMap data updates exist; Exiting.
```

View the results in a nice format:

```bash
ncn-w001:~/ # kubectl get cm -n services cray-product-catalog -o json | jq .data.example | ./yq r -
1.2.3:
  this:
    is: some
    yaml: stuff
```

## Configuration

All configuration options are provided as environment variables.

### Required Environment Variables

* `PRODUCT` = (no default)

> The name of the Cray/Shasta product that is being cataloged.

* `PRODUCT_VERSION` = (no default)

> The SemVer version of the Cray/Shasta product that is being imported, e.g.
  `1.2.3`.

* `YAML_CONTENT`=  (no default)

> The filesystem location of the YAML that will be added to the config map.

### Optional Environment Variables

 * `CONFIG_MAP` = `cray-product-catalog`

 > The name of the config map to add the `YAML_CONTENT` to.

 * `CONFIG_MAP_NAMESPACE` = `services`

 > The Kubernetes namespace of the `CONFIG_MAP`.

## Build Helpers
This repo uses some build helper scripts from the 
[cms-meta-tools](https://github.com/Cray-HPE/cms-meta-tools) repo. See that repo for more details.

## Local Builds
If you wish to perform a local build, you will first need to clone or copy the contents of the
cms-meta-tools repo to `./cms_meta_tools` in the same directory as the `Makefile`.

## Versioning
We use [SemVer](http://semver.org/) for versioning. See the `.version` file in
the repository root for the current version. Please update that version when
making changes. Other files either read the version string from this file or
have this version string written to them at build time using the update_versions tool
in the cms-meta-tools repo. 

At build time [Jenkinsfile.github](Jenkinsfile.github) generates the Docker version 
and Chart version strings, and writes those to .docker_version and .chart_version
respectively.

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
