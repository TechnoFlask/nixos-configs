{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-eui.000000000000000100a07521327938a8";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
		mountOptions = ["umask=077"];
		extraArgs = ["-n" "nixos_boot"];
              };
            };
	    swap = {
	      size = "16G";
	      content = {
		type = "swap";
		resumeDevice = true;
		extraArgs = ["-L" "nixos_swap"];
	      };
 	    };
            root = {
              size = "200G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
		extraArgs = ["-L" "nixos_root"];
              };
            };
            home = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/home";
		extraArgs = ["-L" "nixos_home"];
              };
            };
          };
        };
      };
    };
  };
}


