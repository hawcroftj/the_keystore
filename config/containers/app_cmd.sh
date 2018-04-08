#!/usr/bin/env bash
 
# Prefix `bundle` with `exec` so puma shuts down gracefully on SIGTERM (i.e. `docker stop`)
RAILS_ENV=production exec bundle exec puma -v -C config/puma.rb -e $RAILS_ROOT;