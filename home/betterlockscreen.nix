{ pkgs
, user
, ...
}:
with (
  builtins.mapAttrs (name: value: builtins.substring 1 6 value) user.colorscheme
); {
  home.packages = with pkgs; [
    betterlockscreen
  ];

  home.file.".config/betterlockscreenrc".text = ''
    # ~/.config/betterlockscreenrc

    # default options
    display_on=0
    span_image=false
    lock_timeout=300
    fx_list=(dim blur dimblur pixel dimpixel color)
    dim_level=40
    blur_level=1
    pixel_scale=10,1000
    solid_color=333333
    wallpaper_cmd="feh --bg-fill"
    quiet=false

    # default theme
    loginbox=${background}66
    loginshadow=${background}00
    locktext="Type password to unlock..."
    font="sans-serif"
    ringcolor=${foreground}7f
    insidecolor=${background}00
    separatorcolor=${background}00
    ringvercolor=${foreground}7f
    insidevercolor=${background}00
    ringwrongcolor=${foreground}7f
    insidewrongcolor=${danger}ff
    timecolor=${foreground}ff
    time_format="%H:%M:%S"
    greetercolor=${foreground}ff
    layoutcolor=${foreground}ff
    keyhlcolor=${success}ff
    bshlcolor=${danger}ff
    veriftext="Verifying..."
    verifcolor=${foreground}ff
    wrongtext="Failure!"
    wrongcolor=${danger}ff
    modifcolor=${danger}ff
    bgcolor=${background}ff


    #
    # expert options (change at own risk!)
    #

    # i3lockcolor_bin="i3lock-color"      # Manually set command for i3lock-color
    # suspend_command="systemctl suspend" # Manually change action e.g. hibernate/suspend-command

    # i3lock-color - custom arguments
    # lockargs=() 						  # overwriting default "(-n)"
    # lockargs+=(--ignore-empty-password) # appending new argument
  '';
}
