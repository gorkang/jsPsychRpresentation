# 1) Copy example tasks to your computer --------------------------------

jsPsychMaker::copy_example_tasks(
  destination_folder = "~/Downloads/ExampleTasks", 
  which_tasks = "MultiChoice"
)


# 2) Copy paste items, adapt csv/excel file --------------------------------

  # Open source document
  rstudioapi::navigateToFile(here::here("R/BRS.txt"))
  
  # Edit instructions
  rstudioapi::navigateToFile("~/Downloads/ExampleTasks/MultiChoice/MultiChoice_instructions.html")
  
  # Adapt csv/excel file
  system("nautilus ~/Downloads/ExampleTasks/MultiChoice/MultiChoice.csv")
  
# 3) Create protocol ------------------------------------------------------

jsPsychMaker::create_protocol(
  canonical_tasks = c("BNT"), # Berlin Numeracy test
  folder_tasks = "~/Downloads/ExampleTasks/", #Brief Resilience Scale
  folder_output = "~/Downloads/protocol9996",
  launch_browser = TRUE
)


# 4) Launch Monkeys ----------------------------------------------------------

  # One monkey
  jsPsychMonkeys::release_the_monkeys(
    uid = 11,
    local_folder_tasks = "~/Downloads/protocol9996/",
    open_VNC = TRUE,
    wait_retry = 0
  )
  
  
  # 10 Monkeys
  # jsPsychMonkeys::release_the_monkeys(
  #   uid = 1:10,
  #   sequential_parallel = "parallel",
  #   number_of_cores = 10,
  #   local_folder_tasks = "~/Downloads/protocol9996/",
  #   open_VNC = FALSE
  # )



# 5) Create project for data preparation ----------------------------------
  
jsPsychHelpeR::run_initial_setup(
  pid = 9996,
  data_location = "~/Downloads/protocol9996/.data/",
  folder = "~/Downloads/jsPsychHelpeR9996", 
  dont_ask = TRUE
)
