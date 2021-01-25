// Copyright 2020-2021 Hewlett Packard Enterprise Development LP
@Library('dst-shared@master') _

dockerBuildPipeline {
    repository = "cray"
    imagePrefix = "cray"
    app = "product-catalog-update"
    name = "product-catalog-update"
    product = "csm"
    description = "Update a product catalog with product/version artifacts"
    useEntryPointForTest = false

    githubPushRepo = "Cray-HPE/cray-product-catalog"
    /*
        By default all branches are pushed to GitHub

        Optionally, to limit which branches are pushed, add a githubPushBranches regex variable
        Examples:
        githubPushBranches =  /master/ # Only push the master branch
        
        In this case, we push bugfix, feature, hot fix, master, and release branches

        NOTE: If this Jenkinsfile is removed, the a Jenkinsfile.github file must be created
        to do this push. See the cray-product-install-charts repo for an example.
    */
    githubPushBranches =  /(bugfix\/.*|feature\/.*|hotfix\/.*|master|release\/.*)/ 
}
