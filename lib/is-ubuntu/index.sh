# Check if the environment is ubuntu

function ubuntu {
  if hash lsb_release 2>/dev/null; then
    if test "${Ubuntu#*`lsb_release -i`}" = "Ubuntu"; then
      echo 0
    else
      echo 1
    fi
  else
    echo 0
  fi  
}
