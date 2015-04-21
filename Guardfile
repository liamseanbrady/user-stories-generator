## Uncomment and set this to only include directories you want to watch
 directories %w(. lib spec bin)

## Uncomment to clear the screen before every task
 clearing :on

## Guard internally checks for changes in the Guardfile and exits.
## If you want Guard to automatically start up again, run guard in a
## shell loop, e.g.:
##
##  $ while bundle exec guard; do echo "Restarting Guard..."; done
##
## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

guard :minitest do
  # with Minitest::Spec
    watch(%r{^spec/(.*)_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^lib/user_story/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^spec/spec_helper\.rb$}) { 'spec' }
end
