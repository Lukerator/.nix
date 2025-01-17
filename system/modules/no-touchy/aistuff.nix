{
	services = {
		open-webui.enable = true;
		ollama = {
			enable = true;
			acceleration = "cuda";
			loadModels = [
				"gemma2:2b"
			];
		};
	};
}
