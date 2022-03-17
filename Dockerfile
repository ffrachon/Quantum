# This uses the latest Docker image built from the samples repository,
# defined by the Dockerfile in Build/images/samples.
FROM mcr.microsoft.com/quantum/samples:a49852d5b46930f6065d8153ead5adf805fb6efd

# Mark that this Dockerfile is used with the samples repository.
ENV IQSHARP_HOSTING_ENV=SAMPLES_HOSTED

# Make sure the contents of our repo are in ${HOME}.
# These steps are required for use on mybinder.org.
USER root
COPY . ${HOME}
RUN chown -R ${USER} ${HOME}

# Finish by dropping back to the notebook user.
USER ${USER}
