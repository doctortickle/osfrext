osf_download_csv <- function(proj_id, path = 'data-raw/') {
  proj <- osfr::osf_retrieve_node(proj_id)
  files <- osfr::osf_ls_files(proj, pattern = '.csv')
  osfr::osf_download(files, path)
}
