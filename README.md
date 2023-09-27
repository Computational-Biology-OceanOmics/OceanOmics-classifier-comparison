# Code to run the OceanOmics classifier comparison scripts and figures

Launch analysis (RStudio): [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Hobbeist/reproducibility-template-R/HEAD?urlpath=rstudio)  
  
  
[![run with docker](https://img.shields.io/badge/run%20with-docker-0db7ed?labelColor=000000&logo=docker)](https://www.docker.com/) [![run with singularity](https://img.shields.io/badge/run%20with-singularity-1d355c.svg?labelColor=000000)](https://sylabs.io/docs/)

## Analysis
This repository contains all data and code to generate the figures and statistics for the analysis `XXXX`. Simply click on the above `binder` button to launch either a Rstudio or Jupyter notebook session in the browser, with access 
to all code and data in this GitHub repository. There, the code can interactively be changed and different plots and statistics can be (re-)created.

### What is binder?
For an overview of what binder is, please check out [this link](https://mybinder.org/).  

## Where does the data in this repo come from?

TODO 

# Documentation: Add documentation on any data created from raw files here

TODO

## How to run this

The entire analysis is based on R targets. Check out the repo, run `targets::tar_make()`, it should rerun the entire analysis and make all figures.

(regenerate the following using `cat('```mermaid', tar_mermaid(), '```', sep='\n')`)

```mermaid
graph LR
  style Legend fill:#FFFFFF00,stroke:#000000;
  style Graph fill:#FFFFFF00,stroke:#000000;
  subgraph Legend
    direction LR
    x7420bd9270f8d27d([""Up to date""]):::uptodate --- x4b0c520b8bc07c5b([""Errored""]):::errored
    x4b0c520b8bc07c5b([""Errored""]):::errored --- xbf4603d6c2c2ad6b([""Stem""]):::none
    xbf4603d6c2c2ad6b([""Stem""]):::none --- xf0bce276fe2b9d3e>""Function""]:::none
  end
  subgraph Graph
    direction LR
    x544a22aeaed1b2e4>"get_truth_data"]:::uptodate --> xbdd42ceae2a54d2c(["truth_set_data"]):::uptodate
    x70199d3b1152e374(["truth_set"]):::uptodate --> xbdd42ceae2a54d2c(["truth_set_data"]):::uptodate
    xc65a25d9d96e8f7c(["blast_hits"]):::uptodate --> xe9d8f2de59f79fa1(["blast_hits_data"]):::uptodate
    x837f996ab35491da>"get_hits_data"]:::uptodate --> xe9d8f2de59f79fa1(["blast_hits_data"]):::uptodate
    x837f996ab35491da>"get_hits_data"]:::uptodate --> x42612793169637e0(["nbc_hits_data"]):::uptodate
    x5117ea88dbd5add2(["nbc_hits"]):::uptodate --> x42612793169637e0(["nbc_hits_data"]):::uptodate
    x4cbe0500373226c1(["classifier_data"]):::uptodate --> xe0fba61fbc506510(["report"]):::uptodate
    x264c7e682ec442b2(["dendrogram"]):::uptodate --> xaf4a1b2829040c15(["saved"]):::uptodate
    x64d5b6c864f8ce9c>"save_plot"]:::uptodate --> xaf4a1b2829040c15(["saved"]):::uptodate
    xf2c68c9c4c5bbbc3(["classifier_distances"]):::uptodate --> x4cbe0500373226c1(["classifier_data"]):::uptodate
    x8279777903f3f13d>"get_classifier_data"]:::uptodate --> x4cbe0500373226c1(["classifier_data"]):::uptodate
    x837f996ab35491da>"get_hits_data"]:::uptodate --> x9024d58abea360f6(["kraken_hits_data"]):::uptodate
    xc4cff7b61e825181(["kraken_hits"]):::uptodate --> x9024d58abea360f6(["kraken_hits_data"]):::uptodate
    xe9d8f2de59f79fa1(["blast_hits_data"]):::uptodate --> x7477a20106b865a4(["subsambled_blast_hits_data"]):::uptodate
    xa731a5475c946be2>"subsample_blast_hits"]:::uptodate --> x7477a20106b865a4(["subsambled_blast_hits_data"]):::uptodate
    x4cbe0500373226c1(["classifier_data"]):::uptodate --> x264c7e682ec442b2(["dendrogram"]):::uptodate
    x994946b41121bfa6>"plot_dendrogram"]:::uptodate --> x264c7e682ec442b2(["dendrogram"]):::uptodate
    x9024d58abea360f6(["kraken_hits_data"]):::uptodate --> xc4269aa5995e6a3f(["subsambled_kraken_hits_data"]):::uptodate
    xa731a5475c946be2>"subsample_blast_hits"]:::uptodate --> xc4269aa5995e6a3f(["subsambled_kraken_hits_data"]):::uptodate
    xcc0ae95627a4c782(["subsampled_nbc_hits_data"]):::uptodate --> x046634d8ccbfc029(["investigate_nbc"]):::uptodate
    x42612793169637e0(["nbc_hits_data"]):::uptodate --> xcc0ae95627a4c782(["subsampled_nbc_hits_data"]):::uptodate
    x7cb45ddc20e499f4>"subsample_nbc_hits"]:::uptodate --> xcc0ae95627a4c782(["subsampled_nbc_hits_data"]):::uptodate
    x7477a20106b865a4(["subsambled_blast_hits_data"]):::uptodate --> xc7b5a37005176fd4(["truth_set_investigation"]):::errored
    xc4269aa5995e6a3f(["subsambled_kraken_hits_data"]):::uptodate --> xc7b5a37005176fd4(["truth_set_investigation"]):::errored
    xcc0ae95627a4c782(["subsampled_nbc_hits_data"]):::uptodate --> xc7b5a37005176fd4(["truth_set_investigation"]):::errored
    xbdd42ceae2a54d2c(["truth_set_data"]):::uptodate --> xc7b5a37005176fd4(["truth_set_investigation"]):::errored
    x801b32f234e20cdc(["classifier_complexity"]):::uptodate --> x801b32f234e20cdc(["classifier_complexity"]):::uptodate
    xe40955de534d0cf1(["plot_asvs_per_dataset"]):::uptodate --> xe40955de534d0cf1(["plot_asvs_per_dataset"]):::uptodate
    xbf5ac67708da2696(["plot_report"]):::uptodate --> xbf5ac67708da2696(["plot_report"]):::uptodate
  end
  classDef uptodate stroke:#000000,color:#ffffff,fill:#354823;
  classDef errored stroke:#000000,color:#ffffff,fill:#C93312;
  classDef none stroke:#000000,color:#000000,fill:#94a4ac;
  linkStyle 0 stroke-width:0px;
  linkStyle 1 stroke-width:0px;
  linkStyle 2 stroke-width:0px;
  linkStyle 29 stroke-width:0px;
  linkStyle 30 stroke-width:0px;
  linkStyle 31 stroke-width:0px;
```