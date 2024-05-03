{ config, pkgs, ... }:

{
    services.syncthing = {
        enable = true;
        user = "nrd";
        configDir = "/home/nrd/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
    
    services.syncthing.settings.devices = {
        # jabe xexei
        "jabe proseros" = { id = "CNM2TPL-H2W3DYZ-FUB54AT-AW464D6-U4236CO-CIL6IG4-Y4H6ZET-I67PLAF"; }; 
        "jabe tablet" = { id = "6IIPECD-WCB2GM6-QQBUX2O-6TJA6DJ-STNZRA2-43DEXS5-SYX3BRC-Z3HEDAD"; }; 
        "jabe tefaxyn" = { id = "DAYZPX7-7LVYBZN-Q6ZUNA2-BJ2E7ED-O6MRTCY-SHNTL6K-DKDUPKC-DQIRBQP"; };
        "jabe spes" = { id = "DRBCWGK-IEMEJUT-7UDIOKI-L43OVYB-ABUZJZW-25ITEDF-H3QM6D2-4OLNZA7"; };
        # <3
        "ralue proseros" = { id = "JLUFVGS-2CXOM5H-FN3GCXE-KFYD3JY-Z44ZFPW-7LXSLH6-HLRCYMJ-7HDBRAF"; };
        "ralue tefaxyn" = { id = "3QNJ7V5-3QCDPU6-UGAWXMT-MC6IKD3-KGY2MA4-QRTVMGJ-U466277-CE3KYQW"; };
        # inax xylei
        "xebang tefaxyn" = { id = "KX4HWNX-2NFRWN7-CDBV4ZG-YFOK25J-IDMG44Q-577HFZS-PEBXEGP-GHDCVQE"; };
        "ecodz proseros" = { id = "NZYHHUY-IFE6IUT-6NTBL7J-5MCCXI4-XJX5ZYI-H3ZH4AX-CEAEHHZ-7GLI3AG"; };
        "lennie tul" = { id = "TGR22FT-KMT2W5Z-RWVVHHV-PPA4K56-AMDQGUB-DR5H27H-55TTE7R-2BBHLAF"; };
    };
}