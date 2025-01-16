{
	services = {
		open-webui.enable = true;
		ollama = {
			enable = true;
			loadModels = [
				"aya-expanse"
				"llama3.3"
				"wizard-vicuna-uncensored"
			];
		};
	};
}
