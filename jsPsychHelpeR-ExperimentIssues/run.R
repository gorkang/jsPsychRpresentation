# Clean old files and DB
# rstudioapi::navigateToFile(".vault/.credentials")
# jsPsychAdmin::clean_up_dev_protocol(protocol_id = "38") # Asks for server password


# Get data ----------------------------------------------------------------

# Remove old outputs
targets::tar_destroy(ask = FALSE)

# Remove old data
file.remove("data/38/38.zip"); Sys.sleep(5)

# Download data from server
jsPsychHelpeR::get_zip(pid = 38, what = "data", where = "data/")


# RUN pipeline -------------------------------------------------------------

  # Your full pipeline is in the file _targets.R. You can open the file with:
  # rstudioapi::navigateToFile("_targets.R")

  # Visualize targets tree
  targets::tar_visnetwork(targets_only = TRUE, label = "time")

  # Run data preparation 
  targets::tar_make()
  
  # If unexpected snapshot test errors:
  # testthat::snapshot_review()
  
  # Open report
  browseURL("outputs/reports/report_analysis.html")
  
  # OLD report with monkey's data
  browseURL("outputs/reports/report_analysis_monkeys.html")
  
  
# Check results -----------------------------------------------------------
  
  # After running the pipeline with targets::tar_make()
  
  # List available objects
  targets::tar_objects()
  
  # Load one of the objects (e.g. DF_analysis)
  targets::tar_load(DF_analysis)
  
  # See DF_analysis dataframe
  DF_analysis$DF_analysis |> View()
  
  
# Edit report ---------------------------------------------------------------

  # Open report_analysis.Rmd and adapt the code:
  rstudioapi::navigateToFile("reports/report_analysis.qmd")
  