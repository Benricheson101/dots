if [[ -z $_NIX_SHELL_PROMPT_LOADED ]] ; then
  local lf=$'\n'
  _NIX_SHELL_PROMPT_LOADED=1
  nix_shell_precmd() {
    if [[ -n "$IN_NIX_SHELL" && "$PROMPT" != "${lf}(${name:-nix-shell}) "* ]] ; then
      PROMPT="${lf}(${name:-nix-shell}) ${PROMPT}"
    fi
  }
  precmd_functions+=(nix_shell_precmd)
fi
