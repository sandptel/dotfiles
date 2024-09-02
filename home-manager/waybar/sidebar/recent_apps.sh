#! /usr/bin/env bash

recent_apps=$(grep 'Exec=' ~/.local/share/applications/*.desktop | cut -d '=' -f 2 | sort | uniq | tail -n 5)
echo "$recent_apps"