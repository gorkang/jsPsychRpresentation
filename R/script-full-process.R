
# 1) Create protocol ---------------------------------------------------------

jsPsychMaker::create_protocol(
  canonical_tasks = c("AIM", # Grupos Socieeconómicos Chile
                      "BNT", # Berlin Numeracy test
                      "EAR"  # Escala de Autoestima de Rosenberg
                      ),
  folder_output = "~/Downloads/protocol999"
)

# 2) Simulate data -----------------------------------------------------------

jsPsychMonkeys::release_the_monkeys(
  uid = 1:10, 
  sequential_parallel = "parallel", 
  number_of_cores = 10, 
  local_folder_tasks = "~/Downloads/protocol999"
)

# This takes ~ 2 minutes... it creates a virtual machine for each monkey to complete the protocol...


# 3) Data preparation --------------------------------------------------------

# This will open a new RStudio project

jsPsychHelpeR::run_initial_setup(
  pid = 999, 
  data_location = "~/Downloads/protocol999/.data", 
  folder = "~/Downloads/jsPsychHelpeR999", 
  dont_ask = TRUE)
