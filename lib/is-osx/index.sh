
function osx {
  if [ "$(uname -s)" = "Darwin" ]; then
    echo 1
  else
    echo 0
  fi
}

