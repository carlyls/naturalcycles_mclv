Flow State

R folder includes code used to create the main results in Brantner et al manuscript 
Flow State: Characterizing Menstrual Cycle Length Variability in a Large Digital Cohort
  flowstate_aim1_descriptives.Rmd: creates descriptive (pre-model) results for paper
  flowstate_aim1_final_forbatch.R: fits final Bayesian lognormal model
  run_bayes_final.sbatch: runs Bayesian code in cluster
  bayes_addedvars_full_15May2026.rds: resulting final Bayesian model from above code
  flowstate_aim1_final_modelsummary.Rmd: summarizes Bayesian model
  
R/Sensitivity folder includes code and results for sensitivity/alternate analyses
  Active_only: model fit only on active/very active women
  Age_bins: model with age and BMI bins but no spotting/sickness/mood in mean model
  Continuous_age: model with continuous age and BMI