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
				basicAuthPasswordFile = ./.other/mangapass.txt;
				extensionRepos = [ "https://raw.githubusercontent.com/keiyoushi/extensions/repo/index.min.json" ];
			};
		};
	};
}
