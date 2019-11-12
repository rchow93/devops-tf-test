#ideally this should be stacked to the instance using config management - workaround for the exercise - please use your own pub key.

resource "aws_key_pair" "bastion" {
  key_name   = "${var.env}-${var.app}-${var.region}-ssh"
  public_key = "${var.ssh-key-dev}"
}