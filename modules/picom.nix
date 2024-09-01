{ config,lib, pkgs, ... }:

{
	services.picom = {
		enable = true;
		fade = false;
		# TODO: figure out animations
	};
}
