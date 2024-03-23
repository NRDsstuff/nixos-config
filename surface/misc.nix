{ config, pkgs, ... }:

{
    # touchscreen in firefox
    environment.sessionVariables = {
        MOZ_USE_XINPUT2 = "1";
    };
}