{ config,lib, pkgs, ... }:

{
	programs.yambar = {
		enable = true;
		package = pkgs.yambar;
	}
}
