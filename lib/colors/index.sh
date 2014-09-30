# TODO: handle non-256 terminals
# https://github.com/twolfson/sexy-bash-prompt/blob/master/.bash_prompt#L11-L58

for i in $(seq 0 $(tput colors)); do
  echo " $(tput setaf $i)Text$(tput sgr0) $(tput bold)$(tput setaf $i)Text$(tput sgr0) $(tput sgr 0 1)$(tput setaf $i)Text$(tput sgr0)  \$(tput setaf $i)"
done
