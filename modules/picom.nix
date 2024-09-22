{ config,lib, pkgs, ... }:

{
	services.picom = {
		enable = true;
		# fade = true;
		# fadeSteps = [ 1 1 ];
		# fadeDelta = 10;
		backend = "glx";
		settings = {
			animations = ({ # seems to not work because nixpkgs unstable has picom v11 but needs v12
				direction = "down";
				preset = "slide-out";
				triggers = [ "close" "hide" ];
			});
		};
	};
}
