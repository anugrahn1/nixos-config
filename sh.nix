{ config, pkgs, ...}:

{
	programs = {
		zsh = {
			enable = true;
			autosuggestion.enable = true;
			syntaxHighlighting.enable = true;
			autocd = false;
			shellAliases = {
				ff = "fastfetch";
				tty-clock = "tty-clock -cSt";
			};
			oh-my-zsh = {
				enable = true;
				theme = "robbyrussell";
				plugins = [
					"fzf"
				];
			};
		};
	};
}
