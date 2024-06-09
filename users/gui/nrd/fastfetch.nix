# Nix variant of config.jsonc
# credit to my gf

{
  general.multithreading = true;
  modules = [
    "break"
    {
      type = "os";
      key = "      os:";
    }
    "break"
    {
      type = "kernel";
      key = "  kernel:";
      format = "{2}";
    }
    # Packages takes forever to load (and probably freeze too)
    # {
    #   type = "packages";
    #   key = "  ";
    # }
    {
      type = "shell";
      key = "   shell:";
    }
    {
      type = "de";
      key = "      de:";
    }
    {
      type = "uptime";
      key = "  uptime:";
    }
    "break"
    {
      type = "cpu";
      key = "     cpu:";
      format = "{1}";
    }
    {
      type = "gpu";
      key = "     gpu:";
    }
    {
      type = "memory";
      key = "     ram:";
    }
    "break"
    {
      type = "disk";
      key = "  system:";
      format = "{2} ({3})";
      folders = "/";
    }
    {
      type = "disk";
      key = "   extra:";
      format = "{2} ({3})";
      folders = "/extra";
    }
    "break"
    {
      type = "colors";
      symbol = "circle";
      paddingLeft = 16;
    }
  ];
  display = {
    brightColor = true;
    bar = { border = false; };
    percent = { type = 11; };
    showErrors = true;
    separator = "  ";
    color = "blue";
  };
  logo = {
    color = {
      "1" = "36";
      "2" = "34";
    };
  };
}
