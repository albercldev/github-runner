FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]
USER root

WORKDIR /actions-runner

RUN apt-get update
RUN apt-get install -y curl

RUN curl -o actions-runner-linux-arm64-2.319.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.319.1/actions-runner-linux-arm64-2.319.1.tar.gz && \
tar xzf ./actions-runner-linux-arm64-2.319.1.tar.gz && \
rm ./actions-runner-linux-arm64-2.319.1.tar.gz && \
./bin/installdependencies.sh

COPY start.sh /actions-runner/start.sh
RUN chmod +x /actions-runner/start.sh

RUN useradd actions-runner && chown -R actions-runner:actions-runner /actions-runner
USER actions-runner

# Configure runner
ENTRYPOINT [ "/bin/bash", "/actions-runner/start.sh" ]
