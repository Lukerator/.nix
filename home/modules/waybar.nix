{
	programs.waybar = {
		enable = true;
		style = builtins.readFile ./waybar/style-cat.css;
		#style = builtins.readFile ./waybar/style-gruv.css;
		settings = [{
			layer = "top";
			position = "top";
			mode = "dock";
			exclusive = true;
			passtrough = false;
			height = 20;
			modules-left = [
				"hyprland/workspaces"
			];
			modules-center = [
				"hyprland/window"
			];
			modules-right = [
				"network"
				"backlight"
				"pulseaudio"
				"battery"
				"clock"
			];
			"hyprland/workspaces" = {
				format = "{}";
				all-outputs = true;
				on-click = "activate";
				persistent-workspaces = {
					"*" = 10;
				};
				on-scroll-up = "hyprctl dispatch workspace e+1";
				on-scroll-down = "hyprctl dispatch workspace e-1";
			};
			"hyprland/window" = {
				format = "{}";
			};
			battery = {
				format = "󰁹  {}%";
			};
			backlight = {
				format = "󰖨  {}";
				device = "acpi_video0";
			};
			network = {
				format = "󰖩  {essid}";
				format-disconnected = "󰖪  disconnected";
				on-click = "kitty nmtui";
			};
			clock = {
				format = "  {:%H:%M  %d/%m} ";
			};
			pulseaudio = {
				format = "{icon} {volume}%";
				tooltip = false;
				format-muted = "  Muted";
				on-scroll-up = "swayosd-client --output-volume raise --max-volume 150";
				on-scroll-down = "swayosd-client --output-volume lower --max-volume 150";
				format-icons = {
					headphone = " ";
					hands-free = " ";
					headset = " ";
					phone = " ";
					portable = " ";
					car = " ";
					default = [ " " " " " " ];
				};
			};
		}];
	};
}
