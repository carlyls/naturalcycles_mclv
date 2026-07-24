---
editor_options: 
  markdown: 
    wrap: 72
---

# Flow State

This repository includes model code to summarize menstrual cycle length
averages and variability across a variety of user-level and cycle-level
factors for a cohort of menstrual tracking app users who responded to a
physical activity survey.

R folder includes code used to create the main results in Brantner et
al. manuscript: *Flow State: Characterizing Menstrual Cycle Length
Variability in a Large Digital Cohort*

-   flowstate_descriptives.Rmd: creates descriptive (pre-model) results
    for paper

-   flowstate_forbatch.R: fits Bayesian lognormal model

-   flowstate_modelsummary.Rmd: summarizes Bayesian model
