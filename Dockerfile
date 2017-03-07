FROM ubuntu:latest

# Update and Install Packages
RUN apt-get update -y && apt-get install --no-install-recommends -y \
    git                 \
    make                \
    texlive             \
    texlive-latex-extra \
&& rm -rf /var/lib/apt/lists/*

# Disable host key checking from within builds as we cannot interactively accept them
# TODO: It might be a better idea to bake ~/.ssh/known_hosts into the container
RUN mkdir -p ~/.ssh
RUN printf "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
