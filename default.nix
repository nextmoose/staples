{
  pkgs ? (import <nixpkgs> {})
} :
let
  x = pkgs;
in
rec {
  pkgs = x;
  staples-source = pkgs.stdenv.mkDerivation {
    name = "staples";
    src = ./.;
    installPhase = ''
      cp --recursive . "$out" &&
        true
    '';
  };
  script =
  {
    name,
    src,
    dependencies ? [],
    configuration ? {}
  } :
  pkgs.stdenv.mkDerivation {
    name = name;
    src = src;
    buildInputs = [ pkgs.makeWrapper ];
    installPhase = ''
      mkdir "$out" &&
	cp --recursive . "$out/src" &&
	echo '${builtins.toJSON configuration}' > "$out/configuration.json"
	chmod 0500 "$out/src/$name.sh" &&
	makeWrapper \
	  "$out/src/$name.sh" \
	  "$out/bin/$name" \
	  --set PATH "${pkgs.stdenv.lib.makeBinPath dependencies}" \
	  --set STORE_DIR "$out" \
          --set STAPLES_SOURCE "${staples-source}" &&
	true
    '';
  };
  scripts = rec {
    add-ssh-host = script {
      name = "add-ssh-host";
      src = ./scripts/add-ssh-host;
      dependencies = [
        pkgs.mktemp
	pkgs.gnused
	pkgs.coreutils
      ];
    };
    cleanup = script {
      name = "cleanup";
      src = ./scripts/cleanup;
      dependencies = [
        pkgs.coreutils
      ];
    };
    development-environment = script {
      name = "development-environment";
      src = ./scripts/development-environment;
      dependencies = [
        pkgs.nix
	git-update
	pkgs.coreutils
	pkgs.which
	ssh
      ];
      configuration = [
        init-development-environment
      ];
    };
    git-prepare = script {
      name = "git-prepare";
      src = ./scripts/git-prepare;
      dependencies = [
        pkgs.git
	git-refresh
	pkgs.coreutils
	uuidgen
	pkgs.vim
	pkgs.gnupg
      ];
    };
    git-refresh = script {
      name = "git-refresh";
      src = ./scripts/git-refresh;
      dependencies = [
        pkgs.git
	git-standing
	pkgs.coreutils
	uuidgen
      ];
    };
    git-standing = script {
      name = "git-standing";
      src = ./scripts/git-standing;
      dependencies = [
        pkgs.git
      ];
    };
    git-update = script {
      name = "git-update";
      src = ./scripts/git-update;
      dependencies = [
        pkgs.git
      ];
    };
    gnupg-key-id = script {
      name = "gnupg-key-id";
      src = ./scripts/gnupg-key-id;
      dependencies = [
        pkgs.gnupg
	pkgs.gnused
	pkgs.gnugrep
	pkgs.coreutils
      ];
    };
    homer = script {
      name = "homer";
      src = ./scripts/homer;
      dependencies = [
        pkgs.nix
      ];
    };
    homey = script {
      name = "homey";
      src = ./scripts/homey;
      dependencies = [
        pkgs.mktemp
	homer
      ];
    };
    hook-development-environment = script {
      name = "hook-development-environment";
      src = ./scripts/hook-development-environment;
      dependencies = [
        init-gnupg
	init-dot-ssh-3
	init-development-environment
	pkgs.which
      ];
    };
    hook-read-write-pass = script {
      name = "hook-read-write-pass";
      src = ./scripts/hook-read-write-pass;
      dependencies = [
        init-gnupg
	init-dot-ssh-1
	init-read-write-pass
	pkgs.which
      ];
    };
    init-development-dot-ssh = script {
      name = "init-development-dot-ssh";
      src = ./scripts/init-development-dot-ssh;
      dependencies = [
        pkgs.gnused
	pkgs.coreutils
      ];
    };
    init-development-environment = script {
      name = "init-development-environment";
      src = ./scripts/init-development-environment;
      dependencies = [
        pkgs.git
	gnupg-key-id
	pkgs.libuuid
	pkgs.which
	post-commit
	pkgs.cowsay
	pkgs.coreutils
      ];
    };
    init-dot-ssh = script {
      name = "init-dot-ssh";
      src = ./scripts/init-dot-ssh;
      dependencies = [
        pkgs.coreutils
	pkgs.gnused
      ];
    };
    init-dot-ssh-1 = script {
      name = "init-dot-ssh-1";
      src = ./scripts/init-dot-ssh-1;
      dependencies = [
        pkgs.coreutils
	pkgs.gnused
	pkgs.pass
      ];
    };
    init-dot-ssh-3 = script {
      name = "init-dot-ssh-3";
      src = ./scripts/init-dot-ssh-3;
      dependencies = [
        pkgs.coreutils
	pkgs.gnused
	pkgs.pass
      ];
    };
    init-gnupg = script {
      name = "init-gnupg";
      src = ./scripts/init-gnupg;
      dependencies = [
        pkgs.gnupg
      ];
    };
    init-read-only-pass = script {
      name = "init-read-only-pass";
      src = ./scripts/init-read-only-pass;
      dependencies = [
        gnupg-key-id
	pkgs.pass
	pkgs.coreutils
      ];
    };
    init-read-write-pass = script {
      name = "init-read-write-pass";
      src = ./scripts/init-read-write-pass;
      dependencies = [
        gnupg-key-id
	pkgs.pass
	pkgs.coreutils
	pkgs.which
	post-commit
      ];
    };
    pass-expiry = script {
      name = "pass-expiry";
      src = ./scripts/pass-expiry;
      dependencies = [
        pkgs.pass
	pkgs.coreutils
	pkgs.gnugrep
	pkgs.gnused
      ];
    };
    pass-phonetic = script {
      name = "pass-phonetic";
      src = ./scripts/pass-phonetic;
      dependencies = [
        pkgs.pass
	phonetic
      ];
    };
    phonetic = script {
      name = "phonetic";
      src = ./scripts/phonetic;
      dependencies = [
	pkgs.coreutils
      ];
    };
    post-commit = script {
      name = "post-commit";
      src = ./scripts/post-commit;
      dependencies = [
        pkgs.coreutils
	pkgs.git
      ];
    };
    read-only-pass = script {
      name = "read-only-pass";
      src = ./scripts/read-only-pass;
      dependencies = [
        pkgs.nix
	git-update
	pkgs.coreutils
      ];
      configuration = [
        init-read-only-pass
      ];
    };
    read-write-pass = script {
      name = "read-write-pass";
      src = ./scripts/read-write-pass;
      dependencies = [
        pkgs.nix
	git-update
	pkgs.coreutils
      ];
      configuration = [
        init-read-only-pass
      ];
    };
    slug = script {
      name = "slug";
      src = ./scripts/slug;
      dependencies = [
        pkgs.gnused
	pkgs.coreutils
	pkgs.pass
      ];
    };
    ssh = script {
      name = "ssh";
      src = ./scripts/ssh;
      dependencies = [
        pkgs.openssh
      ];
    };
    uuidgen = script {
      name = "uuidgen";
      src = ./scripts/uuidgen;
      dependencies = [
        pkgs.coreutils
      ];
    };
  };
}