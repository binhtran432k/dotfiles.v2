.PHONY: kouta

kouta:
	nixos-rebuild switch --flake .#kouta --use-remote-sudo --fast
