# jsPsychHelpeR with {targets}

# Parameters --------------------------------------------------------------

	pid_target = '38'
  
  output_formats = c("csv") # csv2 for Spanish locale csv

  source("_targets_options.R")
  

# Define targets -------------------------------------------------------------
  
targets <- list(
  
  ## Read files --------------------------------------------------------------
  
  # Input files (can be a single zip file or multiple csv files)
  tar_target(input_files, list_input_files(pid_target), format = "file"),
  
  # RAW data
  tar_target(DF_raw, read_data(input_files, is_sensitive = FALSE)),
  
  # Cleaned data
  tar_target(DF_clean, create_clean_data(DF_raw)),
  
  # Dictionary of tasks
  tar_target(DICTIONARY_tasks, create_dictionary_tasks(DF_clean), priority = 1),

  
  ## Prepare tasks -----------------------------------------------------------
  
  # Use R/prepare_template.R to create new preparation_scripts

   tar_target(df_Consent, prepare_Consent(DF_clean, short_name_scale_str = 'Consent')),
   tar_target(df_ExperimentsIssues, prepare_ExperimentsIssues(DF_clean, short_name_scale_str = 'ExperimentsIssues')),
   tar_target(df_Goodbye, prepare_Goodbye(DF_clean, short_name_scale_str = 'Goodbye')),

  
  ## Join tasks --------------------------------------------------------------
  
  tar_target(DF_joined, 
             create_joined(
							 df_Consent,
							 df_ExperimentsIssues,
							 df_Goodbye
             )),
  

  
  ## Analysis ----------------------------------------------------------------- 
  
  # Prepare a DF ready for the analysis
  tar_target(DF_analysis, create_DF_analysis(DF_joined, last_task = "Goodbye_DIRt", save_output = TRUE, DVars = c(""))),
  
  # Descriptive Table 1
  # tar_render(descriptives_table1, "reports/descriptives_table1.Rmd", deployment = "main"),

  # Analysis report
  
  # tar_render(report_analysis, "reports/report_analysis.qmd",
  #            output_file = paste0("../outputs/reports/report_analysis.html")),

  tar_quarto(report_analysis, 
             path = getwd(),
             execute_params = tibble::tibble(DFs = list(DF_analysis))),
  

  # Models
  # tar_target(model_E1, analysis_model_E1(DF_analysis$DF_analysis)),


  # Tables and plots use the model (e.g. model_XXX) as input.  
  # Most model objects in R include the data used to fit the model

  # Tables
  # tar_target(table1_model_E1, analysis_model_E1_table(model_E1)),

  # Plots
  tar_target(plots_descriptive, analysis_descriptive_plots(DF_joined, DF_raw, DF_clean, save_plots = FALSE)),
  # tar_target(plot1_model_E1, analysis_model_E1_plot(model_E1)),
  
  
  ## Tests -------------------------------------------------------------------
  
  # [REMEMBER]: Have to manually put every target we have a test for here (except the automatic tests: 'input_files_automatic_tests_str' takes care of that)
  # tar_target(input_files_automatic_tests_str, list.files(path = "_targets/objects/", pattern="df_*", full.names = FALSE, ignore.case = FALSE)),

  tar_target(TESTS, test_testthat(#input_files_automatic_tests_str = input_files_automatic_tests_str,
                                 input_files,
                                 DF_raw,
                                 DF_clean,
                                 DICTIONARY_tasks,
                                 DF_joined
                                 )
  ),
  
  # Reports ------------------------------------------------------------------

  # Automatic report
  tar_render(report_DF_clean, "reports/report_DF_clean.Rmd", 
             params = list(last_task = "Goodbye",
                           pid_report = gsub("/", "_", pid_target)),
             output_file = paste0("../outputs/reports/report_DF_clean.html")),
  
  # Progress report
  tar_render(report_PROGRESS, path = "reports/report_PROGRESS.Rmd", 
             params = list(input_files_vector = input_files, 
                           pid_report = pid_target, 
                           last_task = "Goodbye", 
                           goal = 500),
             output_file = paste0("../outputs/reports/report_PROGRESS_", gsub("/", "_", pid_target) , ".html"))

)


# Declare pipeline --------------------------------------------------------

  targets
