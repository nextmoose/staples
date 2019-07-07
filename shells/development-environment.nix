{
  staples,
  gpg-private-keys-key,
  gpg-ownertrust-key,
  gpg2-private-keys-key,
  gpg2-ownertrust-key,
  pass-executable,
  upstream-host-name,
  upstream-user,
  upstream-identity-key,
  upstream-known-hosts-key,
  upstream-organization,
  upstream-repository,
  upstream-branch,
  personal-host-name,
  personal-user,
  personal-identity-key,
  personal-known-hosts-key,
  personal-organization,
  personal-repository,
  personal-branch,
  report-host-name,
  report-user,
  report-identity-key,
  report-known-hosts-key,
  report-organization,
  report-repository,
  report-branch,
  committer-name,
  committer-email,
  commit-message
} :
staples.pkgs.mkShell {
  shellHook = ''
    eval $(${staples.scripts.homey}/bin/homey) \
      > "$HOME/log.txt" 2>&1 &&
      export GIT_SSH_COMMAND="$(which ssh) -F $HOME/.ssh/config" &&
      ${staples.scripts.hook-development-environment}/bin/hook-development-environment \
        --gpg-private-keys-key "${gpg-private-keys-key}" \
        --gpg-ownertrust-key "${gpg-ownertrust-key}" \
        --gpg2-private-keys-key "${gpg2-private-keys-key}" \
        --gpg2-ownertrust-key "${gpg2-ownertrust-key}" \
	--pass-executable "${pass-executable}" \
        --upstream-host-name "${upstream-host-name}" \
	--upstream-user "${upstream-user}" \
	--upstream-identity-key "${upstream-identity-key}" \
	--upstream-known-hosts-key "${upstream-known-hosts-key}" \
        --personal-host-name "${personal-host-name}" \
	--personal-user "${personal-user}" \
	--personal-identity-key "${personal-identity-key}" \
	--personal-known-hosts-key "${personal-known-hosts-key}" \
        --report-host-name "${report-host-name}" \
	--report-user "${report-user}" \
	--report-identity-key "${report-identity-key}" \
	--report-known-hosts-key "${report-known-hosts-key}" \
        --upstream-organization "${upstream-organization}" \
        --upstream-repository "${upstream-repository}" \
        --upstream-branch "${upstream-branch}" \
        --personal-organization "${personal-organization}" \
        --personal-repository "${personal-repository}" \
        --personal-branch "${personal-branch}" \
        --report-organization "${report-organization}" \
        --report-repository "${report-repository}" \
        --report-branch "${report-branch}" \
	--committer-name "${committer-name}" \
	--committer-email "${committer-email}" \
	--commit-message "${commit-message}" &&
      cd "$HOME/project" &&
      export UPSTREAM_BRANCH="${upstream-branch}" &&
      true
  '';
  buildInputs = [
    staples.pkgs.vscode
    staples.pkgs.nodejs-10_x
    staples.pkgs.git
    staples.scripts.git-prepare
    staples.scripts.git-refresh
    staples.scripts.git-standing
    staples.pkgs.emacs
  ];
}
