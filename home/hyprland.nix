{ pkgs, ... }:
{
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		settings = {
			"$mod" = "SUPER";
			dwindle.preserve_split = true;
			gestures.workspace_swipe = true;
			monitor = [
				"eDP-1, prefered, auto, 1"
			];
			misc = {
				force_default_wallpaper = 1;
				disable_hyprland_logo = true;
			};
			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
			];
			windowrulev2 = [
				"suppressevent maximize, class:.*"
				"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
			];
			general = {
				gaps_in = 4;
				gaps_out = 10;
				border_size = 2;
				layout = "dwindle";
			};
			exec-once = [
				"swaync"
				"swayosd-server"
				"swaybg -i ~/Pictures/background.png"
				"killall -q waybar;sleep 1 && waybar"
				"${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
			];
			bindel = [
				",XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
				",XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
				",XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
				",XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise --max-volume 150"
				",XF86AudioLowerVolume, exec, swayosd-client --output-volume lower --max-volume 150"
				",XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
			];
			input = {
				repeat_rate = 50;
				sensitivity = 0.4;
				repeat_delay = 300;
				follow_mouse = true;
				kb_layout = "ro";
				touchpad.natural_scroll = true;
				kb_options = "grp:win_space_toggle";
			};
			decoration = {
				rounding = 5;
				active_opacity = 1;
				inactive_opacity = 0.95;
				blur = {
					size = 3;
					passes = 1;
					enabled = true;
					vibrancy = 0.1696;
				};
				shadow = {
					range = 4;
					enabled = false;
					render_power = 3;
				};
			};
			animations = {
				enabled = true;
				bezier = [
					"linear,0,0,1,1"
					"quick,0.15,0,0.1,1"
					"easeOutQuint,0.23,1,0.32,1"
					"almostLinear,0.5,0.5,0.75,1.0"
					"easeInOutCubic,0.65,0.05,0.36,1"
				];
				animation = [
					"fade, 1, 3.03, quick"
					"global, 1, 10, default"
					"fadeIn, 1, 1.73, almostLinear"
					"border, 1, 5.39, easeOutQuint"
					"layers, 1, 3.81, easeOutQuint"
					"windows, 1, 4.79, easeOutQuint"
					"fadeOut, 1, 1.46, almostLinear"
					"layersOut, 1, 1.5, linear, fade"
					"layersIn, 1, 4, easeOutQuint, fade"
					"fadeLayersIn, 1, 1.79, almostLinear"
					"fadeLayersOut, 1, 1.39, almostLinear"
					"windowsOut, 1, 1.49, linear, popin 87%"
					"workspaces, 1, 1.94, almostLinear, fade"
					"workspacesIn, 1, 1.21, almostLinear, fade"
					"workspacesOut, 1, 1.94, almostLinear, fade"
					"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
				];
			};
			bind = [
				"$mod, p, exec, hyprshot -m output"
				"$mod SHIFT, p, exec, hyprshot -m region"

				"$mod, f, fullscreen"
				"$mod, v, togglefloating"
				"$mod, tab, focuscurrentorlast"

				"$mod, up, movefocus, u"
				"$mod, down, movefocus, d"
				"$mod, left, movefocus, l"
				"$mod, right, movefocus, r"

				"$mod SHIFT, up, movewindow, u"
				"$mod SHIFT, down, movewindow, d"
				"$mod SHIFT, left, movewindow, l"
				"$mod SHIFT, right, movewindow, r"

				"$mod CTRL, up, resizeactive, 0 -20"
				"$mod CTRL, down, resizeactive, 0 20"
				"$mod CTRL, left, resizeactive, -20 0"
				"$mod CTRL, right, resizeactive, 20 0"

				"$mod, q, killactive"
				"$mod, d, exec, fuzzel"
				"$mod, l, exec, lutris"
				"$mod, w, exec, zen-twilight"
				"$mod, c, exec, neovide"
				"$mod, e, exec, nautilus"
				"$mod, return, exec, kitty"

				"$mod, 1, workspace, 1"
				"$mod, 2, workspace, 2"
				"$mod, 3, workspace, 3"
				"$mod, 4, workspace, 4"
				"$mod, 5, workspace, 5"
				"$mod, 6, workspace, 6"
				"$mod, 7, workspace, 7"
				"$mod, 8, workspace, 8"
				"$mod, 9, workspace, 9"
				"$mod, 0, workspace, 10"
				"$mod, code:20, workspace, -1"
				"$mod, code:21, workspace, +1"

				"$mod SHIFT, 1, movetoworkspace, 1"
				"$mod SHIFT, 2, movetoworkspace, 2"
				"$mod SHIFT, 3, movetoworkspace, 3"
				"$mod SHIFT, 4, movetoworkspace, 4"
				"$mod SHIFT, 5, movetoworkspace, 5"
				"$mod SHIFT, 6, movetoworkspace, 6"
				"$mod SHIFT, 7, movetoworkspace, 7"
				"$mod SHIFT, 8, movetoworkspace, 8"
				"$mod SHIFT, 9, movetoworkspace, 9"
				"$mod SHIFT, 0, movetoworkspace, 10"
				"$mod SHIFT, code:20, movetoworkspace, -1"
				"$mod SHIFT, code:21, movetoworkspace, +1"

			];
		};
	};
}
