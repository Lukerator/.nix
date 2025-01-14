{
	programs.nixvim.plugins.vimtex = {
		enable = true;
		mupdfPackage = null;
		xdotoolPackage = null;
		zathuraPackage = null;
		texlivePackage = null;
		settings = {
			view_method = "zathura";
		};
	};
}
