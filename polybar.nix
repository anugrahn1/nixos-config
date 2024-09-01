{ config,lib, pkgs, ... }:

{
	services.polybar = {
		enable = true;
		config = {
			"bar/top" = {
				monitor = "\${env:MONITOR:DP-2.1}";
				width = "100%";
				height = "28pt";
				radius = 0;
				modules-center = "date";
				background = "#bb1e1e2e";
			};

			"module/date" = {
				type = "internal/date";
				internal = 1;
				date = "%I:%M %p";
				date-alt = "%m-%d-%Y %I:%M %p";
				# time = "%H:%M";
				label = "%date%";
			};
		};
		script = "polybar bar &top";
	};
}
