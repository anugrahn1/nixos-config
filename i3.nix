{ config,lib, pkgs, ... }:


{
	xsession.windowManager.i3 = {
		enable = true;
		package = pkgs.i3-gaps;
		config = {
			terminal = "kitty";
			# gaps = {
			# 	inner = 30;
			# 	outer = 5;
			# };
			startup = [
				{ command = "blueman-applet";}
			];

			keybindings = let modifier = "Mod1";
			in lib.mkOptionDefault {
					"${modifier}+h" = "focus left";
					"${modifier}+j" = "focus down";
					"${modifier}+k" = "focus up";
					"${modifier}+l" = "focus right";


					"${modifier}+SHIFT+h" = "move left";
					"${modifier}+SHIFT+j" = "move down";
					"${modifier}+SHIFT+k" = "move up";
					"${modifier}+SHIFT+l" = "move right";

					"${modifier}+q" = "kill";

					"${modifier}+n" = "exec firefox";
					"${modifier}+b" = "exec blueman-manager";

			};
		};

			extraConfig = ''
				exec_always --no-startup-id picom -b
				exec_always --no-startup-id nitrogen --restore

				for_window [class="^.*"] border pixel 2
				set $rosewater #f5e0dc
				set $flamingo  #f2cdcd
				set $pink      #f5c2e7
				set $mauve     #cba6f7
				set $red       #f38ba8
				set $maroon    #eba0ac
				set $peach     #fab387
				set $yellow    #f9e2af
				set $green     #a6e3a1
				set $teal      #94e2d5
				set $sky       #89dceb
				set $sapphire  #74c7ec
				set $blue      #89b4fa
				set $lavender  #b4befe
				set $text      #cdd6f4
				set $subtext1  #bac2de
				set $subtext0  #a6adc8
				set $overlay2  #9399b2
				set $overlay1  #7f849c
				set $overlay0  #6c7086
				set $surface2  #585b70
				set $surface1  #45475a
				set $surface0  #313244
				set $base      #1e1e2e
				set $mantle    #181825
				set $crust     #11111b

				# target                 title     bg    text      indicator    border
				client.focused           $mantle   $mauve $mantle  $rosewater $mauve
				client.focused_inactive  $overlay0 $base  $text    $rosewater $overlay0
				client.unfocused         $overlay0 $base  $text    $rosewater $overlay0
				client.urgent            $peach    $base  $peach   $overlay0  $peach
				client.placeholder       $overlay0 $base  $text    $overlay0  $overlay0
				client.background        $base
				
				gaps inner 2
				gaps outer 2
				font pango:JetBrainsMono Nerd Font 14
			'';

	};
}
