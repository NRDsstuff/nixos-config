{ ... }:
{
    nix = {

        # Automatic garbage collecting
        gc = {
            automatic = true;
            dates = "daily";
            options = "--delete-older-than 30d";
        };

        # Automatic optimisation
        optimise = {
            automatic = true;
            dates = ["20:00" "daily"];
        };

    };
}