jsPsychMaker::copy_example_tasks(
  destination_folder = "~/Downloads/ExampleTasks", 
  which_tasks = "Slider"
)


system("nautilus ~/Downloads/ExampleTasks/Slider/Slider.csv")


jsPsychMaker::create_protocol(
  canonical_tasks = c("AIM", "BNT", "CRTMCQ4"),
  folder_tasks = "~/Downloads/ExampleTasks/",
  folder_output = "~/Downloads/protocol9996",
  launch_browser = TRUE
)

jsPsychMonkeys::release_the_monkeys(
  uid = 11, 
  local_folder_tasks = "~/Downloads/protocol9996/",
  open_VNC = TRUE,
  wait_retry = 0
)


jsPsychHelpeR::run_initial_setup(
  pid = 9996,
  data_location = "~/Downloads/protocol9996/.data/",
  folder = "~/Downloads/jsPsychHelpeR9996", 
  dont_ask = TRUE
)
