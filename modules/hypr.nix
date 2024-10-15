{
  config,
  lib,
  pkgs,
  ...
}:

{

  wayland.windowManager.hyprland.enable = true; # enable Hyprland
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.hyprland.settings = {
    "$mod" = "ALT";
    "$terminal" = "kitty";
    "$browser" = "zen";
    "$file_manager" = "thunar";
    bind = [
      "$mod, N, exec, $browser"
      "$mod, RETURN, exec, $terminal"
      "$mod, Q, killactive"
      "$mod, M, exit"
      "$mod, F, fullscreen"

      # Move focus with mainMod + hjkl 
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"

      "$mod SHIFT, h, movewindow, l"
      "$mod SHIFT, l, movewindow, r"
      "$mod SHIFT, k, movewindow, u"
      "$mod SHIFT, j, movewindow, d"
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
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"

    ];
    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    monitor = [
      "DP-6, 1920x1080@165, 0x0, 1"
      "DP-5, 1920x1080@165, 1920x0, 1"
      # "eDP-1, disable"
    ];
    env = [
      "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      "GBM_BACKEND,nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
    ];
    cursor = {
      no_hardware_cursors = true;
    };
    windowrulev2 = [
      "suppressevent maximize, class:.*" # You'll probably like this.
    ];
  };

}
