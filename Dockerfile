ARG BASE_IMAGE
FROM ${BASE_IMAGE}

# on build (from base image) will copy application files

# provide the port for Plumber, so that running/testing outside of Heroku is possible
# Heroku will override the PORT value at runtime
ENV PORT=8080

# override the base image CMD to run Plumber
CMD ["/usr/bin/R", "--no-save", "--gui-none", "-f", "/app/app.R"]
