{
  staples
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
