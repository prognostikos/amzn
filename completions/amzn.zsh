if [[ ! -o interactive ]]; then
    return
fi

compctl -K _amzn amzn

_amzn() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(amzn commands)"
  else
    completions="$(amzn completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
