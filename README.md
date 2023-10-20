# OceanOmics classifier comparison scripts

Launch analysis (RStudio): [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/PhilippBayer/OceanOmics-classifier-comparison/HEAD?urlpath=rstudio)  

[![run with docker](https://img.shields.io/badge/run%20with-docker-0db7ed?labelColor=000000&logo=docker)](https://www.docker.com/) [![run with singularity](https://img.shields.io/badge/run%20with-singularity-1d355c.svg?labelColor=000000)](https://sylabs.io/docs/)

## Analysis
This repository contains all data and code to generate the figures and statistics for the OceanOmics taxonomic classifier comparison study. Simply click on the above `binder` button to launch either a Rstudio or Jupyter notebook session in the browser, with access to all code and data in this GitHub repository. There, the code can interactively be changed and different plots and statistics can be (re-)created. The entire analysis is based on R targets which keeps track of all data objects which ensures full reproducibility.

### What is binder?
For an overview of what binder is, please check out [this link](https://mybinder.org/).  

### What is targets?
For an overview of what targets is, please check out [this link](https://books.ropensci.org/targets/walkthrough.html).

## Where does the data in this repo come from?

This data is based on parsing the output of several classifiers. The code for that is in the `parsing/` folder.

## How to run this

Check out the repo, run `targets::tar_make()`, it should rerun the entire analysis and make all figures.

(regenerate the following using `cat('```mermaid', targets::tar_mermaid(), '```', sep='\n')`)

```mermaid
graph LR
  style Legend fill:#FFFFFF00,stroke:#000000;
  style Graph fill:#FFFFFF00,stroke:#000000;
  subgraph Legend
    direction LR
    x0a52b03877696646([""Outdated""]):::outdated --- x7420bd9270f8d27d([""Up to date""]):::uptodate
    x7420bd9270f8d27d([""Up to date""]):::uptodate --- x4b0c520b8bc07c5b([""Errored""]):::errored
    x4b0c520b8bc07c5b([""Errored""]):::errored --- x70a5fa6bea6f298d[""Pattern""]:::none
    x70a5fa6bea6f298d[""Pattern""]:::none --- xbf4603d6c2c2ad6b([""Stem""]):::none
    xbf4603d6c2c2ad6b([""Stem""]):::none --- xf0bce276fe2b9d3e>""Function""]:::none
  end
  subgraph Graph
    direction LR
    x21ec04b3aba1a739>"precision"]:::uptodate --> xcd3647a431ed3d93>"make_mean_median_f1_table"]:::uptodate
    x8f227df403c8969f>"accuracy"]:::uptodate --> xcd3647a431ed3d93>"make_mean_median_f1_table"]:::uptodate
    x5bd3c0b98612ad82>"f0.5"]:::uptodate --> xcd3647a431ed3d93>"make_mean_median_f1_table"]:::uptodate
    xdfc9ff1b391aa400>"f1"]:::uptodate --> xcd3647a431ed3d93>"make_mean_median_f1_table"]:::uptodate
    x47d805de93d2f724>"recall"]:::uptodate --> xcd3647a431ed3d93>"make_mean_median_f1_table"]:::uptodate
    x5f73e2549f58db1c(["correctness_table"]):::outdated --> x70622bc5282148b6(["median_f1_table"]):::outdated
    xcd3647a431ed3d93>"make_mean_median_f1_table"]:::uptodate --> x70622bc5282148b6(["median_f1_table"]):::outdated
    x9024d58abea360f6(["kraken_hits_data"]):::outdated --> xc4269aa5995e6a3f(["subsambled_kraken_hits_data"]):::outdated
    xa731a5475c946be2>"subsample_blast_hits"]:::uptodate --> xc4269aa5995e6a3f(["subsambled_kraken_hits_data"]):::outdated
    x4cbe0500373226c1(["classifier_data"]):::outdated --> xe0fba61fbc506510(["report"]):::outdated
    xc65a25d9d96e8f7c(["blast_hits"]):::uptodate --> xe9d8f2de59f79fa1(["blast_hits_data"]):::outdated
    x837f996ab35491da>"get_hits_data"]:::uptodate --> xe9d8f2de59f79fa1(["blast_hits_data"]):::outdated
    xe9d8f2de59f79fa1(["blast_hits_data"]):::outdated --> x7477a20106b865a4(["subsambled_blast_hits_data"]):::outdated
    xa731a5475c946be2>"subsample_blast_hits"]:::uptodate --> x7477a20106b865a4(["subsambled_blast_hits_data"]):::outdated
    x837f996ab35491da>"get_hits_data"]:::uptodate --> x9024d58abea360f6(["kraken_hits_data"]):::outdated
    xc4cff7b61e825181(["kraken_hits"]):::uptodate --> x9024d58abea360f6(["kraken_hits_data"]):::outdated
    x42612793169637e0(["nbc_hits_data"]):::outdated --> xcc0ae95627a4c782(["subsampled_nbc_hits_data"]):::outdated
    x7cb45ddc20e499f4>"subsample_nbc_hits"]:::uptodate --> xcc0ae95627a4c782(["subsampled_nbc_hits_data"]):::outdated
    xa63f30966279f049["all_results"]:::outdated --> x92e63fc22641faa5(["merged_all_results"]):::outdated
    x38eaffe45ba1cf7e>"load_and_merge_all_results"]:::uptodate --> x92e63fc22641faa5(["merged_all_results"]):::outdated
    x9024d58abea360f6(["kraken_hits_data"]):::outdated --> x9f533bb9ed6cc0bf(["thirty_subsampled_kraken_hits_data"]):::outdated
    x1f8a2aa3facf1873>"subsample_blast_thirty_hits"]:::uptodate --> x9f533bb9ed6cc0bf(["thirty_subsampled_kraken_hits_data"]):::outdated
    x264c7e682ec442b2(["dendrogram"]):::outdated --> xaf4a1b2829040c15(["saved"]):::outdated
    x063d54dad6ed438a>"my_save_plot"]:::uptodate --> xaf4a1b2829040c15(["saved"]):::outdated
    x92e63fc22641faa5(["merged_all_results"]):::outdated --> xb55a8ff957ab9650(["final_outcomes_rottnest"]):::outdated
    xbdd42ceae2a54d2c(["truth_set_data"]):::outdated --> xb55a8ff957ab9650(["final_outcomes_rottnest"]):::outdated
    x7477a20106b865a4(["subsambled_blast_hits_data"]):::outdated --> xc7b5a37005176fd4(["truth_set_investigation"]):::outdated
    xc4269aa5995e6a3f(["subsambled_kraken_hits_data"]):::outdated --> xc7b5a37005176fd4(["truth_set_investigation"]):::outdated
    xcc0ae95627a4c782(["subsampled_nbc_hits_data"]):::outdated --> xc7b5a37005176fd4(["truth_set_investigation"]):::outdated
    xf80ecf3117225a62(["thirty_subsambled_blast_hits_data"]):::outdated --> xc7b5a37005176fd4(["truth_set_investigation"]):::outdated
    x9f533bb9ed6cc0bf(["thirty_subsampled_kraken_hits_data"]):::outdated --> xc7b5a37005176fd4(["truth_set_investigation"]):::outdated
    x25ebbc9fc53b1418(["thirty_subsampled_nbc_hits_data"]):::outdated --> xc7b5a37005176fd4(["truth_set_investigation"]):::outdated
    xbdd42ceae2a54d2c(["truth_set_data"]):::outdated --> xc7b5a37005176fd4(["truth_set_investigation"]):::outdated
    x4cbe0500373226c1(["classifier_data"]):::outdated --> x264c7e682ec442b2(["dendrogram"]):::outdated
    x994946b41121bfa6>"plot_dendrogram"]:::uptodate --> x264c7e682ec442b2(["dendrogram"]):::outdated
    x0fe0b162e5f2d977(["counted_correctness"]):::outdated --> x8c50ad78daae7d7d(["correctness_figure"]):::outdated
    x5071aff9d46fc375>"plot_correctness"]:::uptodate --> x8c50ad78daae7d7d(["correctness_figure"]):::outdated
    x92e63fc22641faa5(["merged_all_results"]):::outdated --> x4c3c668f02e94ea5(["final_outcomes_100"]):::outdated
    xbdd42ceae2a54d2c(["truth_set_data"]):::outdated --> x4c3c668f02e94ea5(["final_outcomes_100"]):::outdated
    xcc0ae95627a4c782(["subsampled_nbc_hits_data"]):::outdated --> x046634d8ccbfc029(["investigate_nbc"]):::outdated
    x62f627c2bcc7f4a3>"assess_correctness"]:::uptodate --> x5f73e2549f58db1c(["correctness_table"]):::outdated
    x92e63fc22641faa5(["merged_all_results"]):::outdated --> x5f73e2549f58db1c(["correctness_table"]):::outdated
    xbdd42ceae2a54d2c(["truth_set_data"]):::outdated --> x5f73e2549f58db1c(["correctness_table"]):::outdated
    x837f996ab35491da>"get_hits_data"]:::uptodate --> x42612793169637e0(["nbc_hits_data"]):::outdated
    x5117ea88dbd5add2(["nbc_hits"]):::uptodate --> x42612793169637e0(["nbc_hits_data"]):::outdated
    x2ff9bf2efd8ea8fa(["all_results_files"]):::outdated --> xa63f30966279f049["all_results"]:::outdated
    x42612793169637e0(["nbc_hits_data"]):::outdated --> x25ebbc9fc53b1418(["thirty_subsampled_nbc_hits_data"]):::outdated
    x476c8f557e2b0910>"subsample_nbc_hits_thirty"]:::uptodate --> x25ebbc9fc53b1418(["thirty_subsampled_nbc_hits_data"]):::outdated
    x544a22aeaed1b2e4>"get_truth_data"]:::uptodate --> xbdd42ceae2a54d2c(["truth_set_data"]):::outdated
    x70199d3b1152e374(["truth_set"]):::errored --> xbdd42ceae2a54d2c(["truth_set_data"]):::outdated
    x92e63fc22641faa5(["merged_all_results"]):::outdated --> xf37c16a7303abc16(["final_outcomes_negative_bacteria"]):::outdated
    xbdd42ceae2a54d2c(["truth_set_data"]):::outdated --> xf37c16a7303abc16(["final_outcomes_negative_bacteria"]):::outdated
    x8c50ad78daae7d7d(["correctness_figure"]):::outdated --> x962124a214cc566f(["save_correct"]):::outdated
    x063d54dad6ed438a>"my_save_plot"]:::uptodate --> x962124a214cc566f(["save_correct"]):::outdated
    xf2c68c9c4c5bbbc3(["classifier_distances"]):::uptodate --> x4cbe0500373226c1(["classifier_data"]):::outdated
    x8279777903f3f13d>"get_classifier_data"]:::uptodate --> x4cbe0500373226c1(["classifier_data"]):::outdated
    x5f73e2549f58db1c(["correctness_table"]):::outdated --> x0fe0b162e5f2d977(["counted_correctness"]):::outdated
    x057c70bd2d39499f>"count_correctness"]:::uptodate --> x0fe0b162e5f2d977(["counted_correctness"]):::outdated
    xe9d8f2de59f79fa1(["blast_hits_data"]):::outdated --> xf80ecf3117225a62(["thirty_subsambled_blast_hits_data"]):::outdated
    x1f8a2aa3facf1873>"subsample_blast_thirty_hits"]:::uptodate --> xf80ecf3117225a62(["thirty_subsambled_blast_hits_data"]):::outdated
    x801b32f234e20cdc(["classifier_complexity"]):::uptodate --> x801b32f234e20cdc(["classifier_complexity"]):::uptodate
    xe40955de534d0cf1(["plot_asvs_per_dataset"]):::uptodate --> xe40955de534d0cf1(["plot_asvs_per_dataset"]):::uptodate
    xbf5ac67708da2696(["plot_report"]):::uptodate --> xbf5ac67708da2696(["plot_report"]):::uptodate
    xae01b2c9af307a4d>"get_stats_on_correctness"]:::uptodate --> xae01b2c9af307a4d>"get_stats_on_correctness"]:::uptodate
  end
  classDef outdated stroke:#000000,color:#000000,fill:#78B7C5;
  classDef uptodate stroke:#000000,color:#ffffff,fill:#354823;
  classDef errored stroke:#000000,color:#ffffff,fill:#C93312;
  classDef none stroke:#000000,color:#000000,fill:#94a4ac;
  linkStyle 0 stroke-width:0px;
  linkStyle 1 stroke-width:0px;
  linkStyle 2 stroke-width:0px;
  linkStyle 3 stroke-width:0px;
  linkStyle 4 stroke-width:0px;
  linkStyle 65 stroke-width:0px;
  linkStyle 66 stroke-width:0px;
  linkStyle 67 stroke-width:0px;
  linkStyle 68 stroke-width:0px;
```