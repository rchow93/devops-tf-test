locals {
  name = "${var.region}-${var.env}-${var.app}-${var.kubernetes-name}"
  common_tags = {
    Environment = "${var.env}"
    Region      = "${var.region}"
    App         = "${var.app}"
    "kubernetes.io/cluster/${var.kubernetes-name}" = "shared"
    KubernetesCluster = "${var.kubernetes-name}"
  }
}



