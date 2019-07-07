{
  staples,
  gpg-private-keys-key,
  gpg-ownertrust-key,
  gpg2-private-keys-key,
  gpg2-ownertrust-key,
  pass-executable,
  personal-host-name,
  personal-user,
  personal-identity-key,
  personal-known-hosts-key,
  personal-organization,
  personal-repository,
  personal-branch,
  committer-name,
  committer-email
} :
staples.pkgs.mkShell {
  shellHook = ''
    eval $(${staples.scripts.homey}/bin/homey) \
      > "$HOME/log.txt" 2>&1 &&
      cd "$HOME" &&
      export PATH="$PATH:/usr/bin:/usr/sbin:/sbin" &&
      export GIT_SSH="${staples.scripts.ssh}/bin/ssh" &&
      export PASSWORD_STORE_ENABLE_EXTENSIONS=true &&
      ${staples.scripts.hook-read-write-pass}/bin/hook-read-write-pass \
        --gpg-private-keys-key "${gpg-private-keys-key}" \
        --gpg-ownertrust-key "${gpg-ownertrust-key}" \
        --gpg2-private-keys-key "${gpg2-private-keys-key}" \
        --gpg2-ownertrust-key "${gpg2-ownertrust-key}" \
	--pass-executable "${pass-executable}" \
	--personal-host-name "${personal-host-name}" \
	--personal-user "${personal-user}" \
	--personal-identity-key "${personal-identity-key}" \
	--personal-known-hosts-key "${personal-known-hosts-key}" \
	--personal-organization "${personal-organization}" \
	--personal-repository "${personal-repository}" \
	--personal-branch "${personal-branch}" \
	--committer-name "${committer-name}" \
	--committer-email "${committer-email}" &&
      source ${staples.pkgs.pass}/share/bash-completion/completions/pass &&
      source ${staples.scripts.pass-phonetic}/src/bash-completion.sh &&
      export PASSWORD_STORE_EXTENSION_COMMANDS=(expiry phonetic) &&
      ${staples.pkgs.coreutils}/bin/mkdir "$HOME/.password-store/.extensions" &&
      ${staples.pkgs.coreutils}/bin/ln --symbolic ${staples.scripts.pass-expiry}/bin/pass-expiry "$HOME/.password-store/.extensions/expiry.bash" &&
      ${staples.pkgs.coreutils}/bin/ln --symbolic ${staples.scripts.pass-phonetic}/bin/pass-phonetic "$HOME/.password-store/.extensions/phonetic.bash" &&
      true
  '';
  buildInputs = [
    staples.pkgs.pass
    staples.pkgs.gnupg
    staples.scripts.gnupg-key-id
    staples.scripts.phonetic
    staples.scripts.slug
    staples.pkgs.paperkey
  ];
}
