{ config,lib, pkgs, ... }:

{
	services.picom = {
		enable = true;
		# fade = true;
		# fadeSteps = [ 1 1 ];
		# fadeDelta = 10;
		backend = "glx";
		# TODO: figure out animations
	};
}
