{
	services.suwayomi-server = {
		enable = true;
		dataDir = "/var/lib/suwayomi";
		openFirewall = true;
		settings = {
			server = {
				port = 4567;
				basicAuthEnabled = true;
				basicAuthUsername = "Lukerator";
				basicAuthPasswordFile = ./Other/mangapass.txt;
				extensionRepos = [ "https://raw.githubusercontent.com/suwayomi/tachiyomi-extension/repo/index.min.json" ];
			};
		};
	};
}
