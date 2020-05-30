context('Downloading OSF .csv documents')

# setup ---------------------
setup({
  outdir <<- as.character(fs::dir_create('.osfrext-tests'))
  id <<- 'df726'
})

teardown({
  fs::dir_delete(outdir)
})

# tests ----------------------

test_that("a .csv file is downloaded from a project.", {
  skip_if_no_pat()
  skip_on_production_server()

  out <- osf_download_csv(id, path = outdir)
  expect_s3_class(out, 'osf_tbl_file')
  expect_true(file.exists(out$local_path))

  # Verify the local_path wasn't returned as a relative path.
  expect_equal(dirname(out$local_path), outdir)
})
