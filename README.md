# A template for a combined docker-renv environment

- Clone this/use as a template
- Start working within R. Populate your `renv` environment. Don't forget to `renv::snapshot()`
- Adjust the [Dockerfile](build/Dockerfile). The default includes Stata, you may not need it. 
- Adjust the (hidden) [.myconfig.sh](.myconfig.sh) in particular the name and where you want to store the Docker image.
- Build the docker image with [build-r.sh](build/build-r.sh): `cd build; bash ./build-r.sh`. It will use the `renv.lock` file to populate packages into the image. These will be available next time you run the image. 
- Launch Rstudio as a web app by running `bash ./start_rstudio.sh`.

## System Requirements

- Works with command line Docker on Linux. Not tested in any other environment.
- The resulting Docker image should be usable in any environment.


