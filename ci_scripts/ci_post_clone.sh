#!/bin/sh

# ci_post_clone.sh

# install Selene
brew tap zunda-pixel/selene
brew install zunda-pixel/selene/selene

# change directory to project top from ci_scripts
cd ..

env_file=".env"
touch $env_file

cat > $env_file <<EOL
clientID=${CLIENT_ID}
clientSecret=${CLIENT_SECRET}
EOL

cd GitBoardKit

selene SecureEnv .env /GitBoardData/Sources/Env/SecureEnv.swift
