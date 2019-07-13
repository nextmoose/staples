{
  staples,
  hook ? { staples } : ''
    HOME=$(${staples.pkgs.mktemp}/bin/mktemp -d) &&
      cleanup(){
        ${staples.pkgs.cowsay}/bin/cowsay Good Bye &&
          ${staples.pkgs.coreutils}/bin/rm --recursive --force $HOME &&
	  true
      } &&
      trap cleanup EXIT &&
      ${staples.pkgs.cowsay}/bin/cowsay Hello &&
      true
  '',
  input ? { staples } : [
    staples.pkgs.atari800
  ]
} :
staples.pkgs.mkShell {
  shellHook = ''
    ${staples.pkgs.cowsay}/bin/cowsay hello &&
      ${staples.scripts.homey}/bin/homey &&
      eval $(${staples.scripts.homey}/bin/homey) &&
      true
  '';
  buildInputs = [
    staples.pkgs.emacs
  ];
}
