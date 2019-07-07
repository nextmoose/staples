{
  staples,
  gpg-private-keys-file,
  gpg-ownertrust-file,
  gpg2-private-keys-file,
  gpg2-ownertrust-file,
  canonical-remote,
  canonical-branch
} :
staples.pkgs.mkShell {
  shellHook = ''
    eval $(${staples.scripts.homey}/bin/homey) \
      > "$HOME/log.txt" 2>&1 &&
      export PATH="$PATH:/usr/bin:/usr/sbin:/sbin" &&
      ${staples.scripts.init-gnupg}/bin/init-gnupg \
        --gpg-private-keys-file "${gpg-private-keys-file}" \
        --gpg-ownertrust-file "${gpg-ownertrust-file}" \
        --gpg2-private-keys-file "${gpg2-private-keys-file}" \
        --gpg2-ownertrust-file "${gpg2-ownertrust-file}" \
	>> "$HOME/log.txt" 2>&1 &&
      ${staples.scripts.init-read-only-pass}/bin/init-read-only-pass \
        --canonical-remote "${canonical-remote}" \
	--canonical-branch "${canonical-branch}" \
	>> "$HOME/log.txt" 2>&1 &&
      source ${staples.pkgs.pass}/share/bash-completion/completions/pass &&
      true
  '';
  buildInputs = [
    staples.pkgs.pass
  ];
}
