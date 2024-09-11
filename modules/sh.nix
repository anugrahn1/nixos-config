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
				gs = "git status";
				ga = "git add";
				gc = "git commit";
				gp = "git push";
				cd = "z";
				cdd = "cd";
				zathura = "zathura --fork";
				nv = "nvim";
			};
			oh-my-zsh = {
				enable = true;
				theme = "robbyrussell";
				plugins = [
					"fzf"
					"zoxide"
				];
			};
		};
	};
}
