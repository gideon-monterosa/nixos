_: {
  hardware.uinput.enable = true;

  services.kanata = {
    enable = true;
    keyboards.laptop = {
      devices = [
        "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
      ];
      extraDefCfg = ''process-unmapped-keys yes log-layer-changes no '';

      config = ''
        (defsrc
          caps lalt           ralt
          a    s    d    f    j    k    l    ;
        )

        (defvar
          tap-time 200
          hold-time 200
        )

        (defalias
          ;; Capslock and Alt remappings
          caps lctl                                  ;; Capslock -> Control
          lalt (tap-hold $tap-time $hold-time esc lalt)  ;; Left Alt -> Esc on tap, Alt on hold
          ralt (tap-hold $tap-time $hold-time ret ralt)  ;; Right Alt -> Enter on tap, Alt on hold

          ;; Left hand homerow mods (ASDF)
          a (tap-hold $tap-time $hold-time a lsft)
          s (tap-hold $tap-time $hold-time s lalt)
          d (tap-hold $tap-time $hold-time d lctl)
          f (tap-hold $tap-time $hold-time f lmet)

          ;; Right hand homerow mods (JKL;)
          j (tap-hold $tap-time $hold-time j rmet)
          k (tap-hold $tap-time $hold-time k rctl)
          l (tap-hold $tap-time $hold-time l ralt)
          ; (tap-hold $tap-time $hold-time ; rsft)
        )

        (deflayer base
          @caps @lalt         @ralt
          @a    @s    @d   @f    @j   @k   @l   @;
        )
      '';
    };
  };

  users.users.gideon.extraGroups = ["input" "uinput"];
}
