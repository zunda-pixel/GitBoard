#!/bin/sh

# ci_post_clone.sh

defaults write com.apple.dt.Xcode IDESkipPackagePluginFingerprintValidatation -bool YES

cd ..

env_file=".env"
touch $env_file

cat > $env_file <<EOL
clientID=${CLIENT_ID}
clientSecret=${CLIENT_SECRET}
EOL

projectPath=$(pwd)

cd GitBoardKit

swift package plugin --allow-writing-to-directory Sources generate-env ../${env_file} Sources/GitBoardData/Env/Env.swift
