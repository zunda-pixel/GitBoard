#!/bin/sh

# ci_post_clone.sh

# install Selene
brew tap zunda-pixel/selene
brew install zunda-pixel/selene/selene

# change directory to project top from ci_scripts
cd ..

cat > .env <<EOL
clientID=${CLIENT_ID}
clientSecret=${CLIENT_SECRET}
EOL

selene SecureEnv .env ./GitBoardKit/Sources/GitBoardData/Env/SecureEnv.swift
