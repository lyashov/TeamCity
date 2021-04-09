FROM jetbrains/teamcity-agent:latest

USER root

# Install dependecies
RUN set -x && \
    apt-get update -y && \
    apt-get install -y \
        # Basic stuff
        bzip2 \
        curl \
        git \
        tar \
        unzip \
        wget
		
# Install node 10.x and npm 6.x
RUN set -x && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@6

# Add yarn
RUN set -x && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -y && \
    apt-get install -y yarn