#' Download all comma-separated-value (\code{.csv}) files from an \acronym{OSF} project or component.
#'
#' @description Download all \code{.csv} files from an existing \acronym{OSF} project or component
#'   based on the associated unique identifier. This is a 5-character global unique identifier (\acronym{GUID}).
#'   See below for details. Note that this function only downloads files listed in the top-level directory.
#' @usage
#'osf_download (
#'   id,
#'   path = 'data-raw/'
#' )
#' @param id An \acronym{OSF} identifier corresponding to an \acronym{OSF} project or component.
#' @param path Path pointing to a local directory where the downloaded files will be saved.
#'   Default is to use \file{data-raw/}.
#' @details See package \link[osfr]{osfr} for additional information.
#' @examples
#' osf_download_csv('5ad84')
#' osf_download_csv('5ad84', 'new_data/')
#' @export

osf_download_csv <- function(id, path = 'data-raw/') {
  proj <- osfr::osf_retrieve_node(id)
  files <- osfr::osf_ls_files(proj, type = 'file', pattern = '.csv')
  osfr::osf_download(files, path, conflicts = 'overwrite')
}
