#! /usr/bin/env nix-shell
#! nix-shell -i bash -p curl

argument="$1"

url="https://trigger.macrodroid.com/faa85697-945e-4a23-8ef3-c13e2f5e0638/$argument"

if [ -z "$argument" ]; then
  echo "Error: Please provide an argument (up or down)"
  exit 1
fi

curl $url

