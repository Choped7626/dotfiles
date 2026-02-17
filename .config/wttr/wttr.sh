#! /usr/bin/env bash
# If you source this file, it will set WTTR_PARAMS as well as show weather.

# WTTR_PARAMS is space-separated URL parameters, many of which are single characters that can be
# lumped together. For example, "F q m" behaves the same as "Fqm".
if [[ -z "$WTTR_PARAMS" ]]; then
  # Form localized URL parameters for curl
  if [[ -t 1 ]] && [[ "$(tput cols)" -lt 125 ]]; then
      WTTR_PARAMS+='n'
  fi 2> /dev/null
  WTTR_PARAMS+='mF0AqTd'
  export WTTR_PARAMS
fi

wttr() {
  local location="${1// /+}"
  test "$#" -gt 0 && shift
  local args=()
  for p in $WTTR_PARAMS "$@"; do
    args+=("--data-urlencode" "$p")
  done
  curl -fGsS -H "Accept-Language: ${LANG%_*}" "${args[@]}" --compressed "wttr.in/${location}"
}


