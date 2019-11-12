module "create_vpc" {
  source = "../../../modules/vpc/"
  #above is ugly code - see below for best practice convention
  #under normal conventions - I use remote github remote for modules to decouple tf code from modules - sample convention.
  #  source = "git@github.com:rchow93/hahmoo-tf-modules.git//vpc"

  cidr_block           = "${var.cidr_block}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"
  env                  = "${var.env}"

  public_subnet_cidr_blocks  = ["${var.public_subnet_cidr_blocks}"]
  private_subnet_cidr_blocks = ["${var.private_subnet_cidr_blocks}"]
  dmz_subnet_cidr_blocks     = ["${var.dmz_subnet_cidr_blocks}"]
  db_subnet_cidr_blocks      = ["${var.db_subnet_cidr_blocks}"]
  app_subnet_cidr_blocks     = ["${var.app_subnet_cidr_blocks}"]
  vpn_subnet_cidr_blocks     = ["${var.vpn_subnet_cidr_blocks}"]
  availability_zones         = ["${var.availability_zones}"]
  my_ips                     = ["${var.my_ips}"]
  app                        = "${var.app}"
  region                     = "${var.region}"
  bastion-instance-type      = "${var.bastion-instance-type}"
  prod-packer-ssh            = "${aws_key_pair.bastion.key_name}"
  kubernetes-name            = "${var.kubernetes-name}"
}



