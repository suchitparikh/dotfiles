cache_complete() {
  local src_file="$1"
  local cache_file="$2"
  local generate_cmd="$3"
  local word=${COMP_WORDS[COMP_CWORD]}

  if [ ! -e "$src_file" ]; then
    return
  fi

  # if the cache file doesn't exists
  # or the src_file is more recent than the cache_file
  if [ ! -f "$cache_file" -o "$src_file" -nt "$cache_file" ]; then
    eval $generate_cmd > $cache_file
  fi

  COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}
  local tasks=$(cat $cache_file)
  COMPREPLY=( $(compgen -W "${tasks}" -- "$word") )
}

_check_rakefile() {
  cache_complete Rakefile ._rake_completion_cache "rake -T | awk '/^rake / {print \$2}'"
}
complete -F _check_rakefile -o default rake
