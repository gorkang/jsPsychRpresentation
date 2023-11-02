# REMEMBER TO CHANGE page number in custom.scss

file.copy(from = "Presentation/index.html", 
          to = "docs/index.html", 
          overwrite = TRUE)




# QR-codes ----------------------------------------------------------------

# # pak::pkg_install("qrcode")
# 
# qrcode::generate_svg(
#   qrcode = qrcode::qr_code("https://gorkang.github.io/jsPsychRpresentation", 
#                            ecl = "H"),
#   filename = "Presentation/img/QR-presentation.svg")
# 
# 
# qrcode::generate_svg(
#   qrcode = qrcode::qr_code("https://cscn.uai.cl/lab/protocols/38/", 
#                            ecl = "H"),
#   filename = "Presentation/img/QR-survey.svg")
