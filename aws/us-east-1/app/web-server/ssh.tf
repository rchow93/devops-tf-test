resource "aws_key_pair" "web-server" {
  key_name   = "${var.env}-${var.app}-${var.region}-ssh"
  public_key = "${var.ssh-key-dev}"
}