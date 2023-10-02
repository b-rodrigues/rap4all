# Download raw Excel

url <- "https://github.com/b-rodrigues/rap4all/raw/master/datasets/vente-maison-2010-2021.xlsx"

# Shortened url
#url <- "https://is.gd/1vvBAc"

raw_data <- tempfile(fileext = ".xlsx")

download.file(url, raw_data, method = "auto", mode = "wb")

sheets <- excel_sheets(raw_data)

read_clean <- function(..., sheet){
  read_excel(..., sheet = sheet) |>
    mutate(year = sheet)
}

raw_data <- map(
  sheets,
  ~read_clean(raw_data,
              skip = 10,
              sheet = .)
                   ) |>
  bind_rows() |>
  clean_names()

raw_data <- raw_data |>
  rename(
    locality = commune,
    n_offers = nombre_doffres,
    average_price_nominal_euros = prix_moyen_annonce_en_courant,
    average_price_m2_nominal_euros = prix_moyen_annonce_au_m2_en_courant,
    average_price_m2_nominal_euros = prix_moyen_annonce_au_m2_en_courant
  ) |>
  mutate(locality = str_trim(locality)) |>
  select(year, locality, n_offers, starts_with("average"))


str(raw_data)

# Let's take a look at the spelling
raw_data |>
  dplyr::filter(grepl("Luxembourg", locality)) |>
  dplyr::count(locality)


raw_data |>
  dplyr::filter(grepl("P.tange", locality)) |>
  dplyr::count(locality)


# Deal with spelling

raw_data <- raw_data |>
  mutate(locality = ifelse(grepl("Luxembourg-Ville", locality),
                           "Luxembourg",
                           locality),
         locality = ifelse(grepl("P.tange", locality),
                           "Pétange",
                           locality)
         ) |>
  mutate(across(starts_with("average"), as.numeric))

# Check if missing data
raw_data |>
  filter(is.na(average_price_nominal_euros))


# Remove rows citing the source
raw_data <- raw_data |>
  filter(!grepl("Source", locality))

#Keep commune level data
commune_level_data <- raw_data |>
    filter(!grepl("nationale|offres", locality),
           !is.na(locality))

# Keep country level data
country_level <- raw_data |>
  filter(grepl("nationale", locality)) |>
  select(-n_offers)

offers_country <- raw_data |>
  filter(grepl("Total d.offres", locality)) |>
  select(year, n_offers)

country_level_data <- full_join(country_level, offers_country) |>
  select(year, locality, n_offers, everything()) |>
  mutate(locality = "Grand-Duchy of Luxembourg")


# We need to check if communes are all in our data
current_communes <- "https://is.gd/lux_communes" |>
  rvest::read_html() |>
  rvest::html_table() |>
  purrr::pluck(2) |>
  janitor::clean_names() |>
  dplyr::filter(name_2 != "Name") |>
  dplyr::rename(commune = name_2) |>
  dplyr::mutate(commune = stringr::str_remove(commune, " .$"))

# Test if all communes are there
setdiff(unique(commune_level_data$locality), current_communes$commune)

# We need former communes
former_communes <- "https://is.gd/lux_former_communes" |>
  rvest::read_html() |>
  rvest::html_table() |>
  purrr::pluck(3) |>
  janitor::clean_names() |>
  dplyr::filter(year_dissolved > 2009)

former_communes

# Put former and current communes together
communes <- unique(c(former_communes$name, current_communes$commune))
# we need to rename some communes

# Different spelling of these communes between wikipedia and the data

communes[which(communes == "Clemency")] <- "Clémency"
communes[which(communes == "Redange")] <- "Redange-sur-Attert"
communes[which(communes == "Erpeldange-sur-Sûre")] <- "Erpeldange"
communes[which(communes == "Luxembourg City")] <- "Luxembourg"
communes[which(communes == "Käerjeng")] <- "Kaerjeng"
communes[which(communes == "Petange")] <- "Pétange"


# Test if this set is empty, if yes, we're good
setdiff(unique(commune_level_data$locality), communes)

# save the data (uncomment if you need to save)
# you may need to create the `datasets` folder first
write.csv(commune_level_data, "datasets/commune_level_data.csv", row.names = TRUE)
write.csv(country_level_data, "datasets/country_level_data.csv", row.names = TRUE)
