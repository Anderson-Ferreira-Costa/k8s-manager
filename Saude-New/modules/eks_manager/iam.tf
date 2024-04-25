resource "aws_iam_role" "manager" {
  name = "EC2-Role-${var.eks_manager_k8s_name}"
  path = "/"

  assume_role_policy = data.aws_iam_policy_document.manager.json
}

data "aws_iam_policy_document" "manager" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_instance_profile" "manager" {
  name = "EC2-Role-${var.eks_manager_k8s_name}"
  role = aws_iam_role.manager.name
}

data "aws_iam_policy_document" "manager_policy" {
  count = length(var.manager_permissions) > 0 ? 1 : 0
  statement {
    actions   = var.manager_permissions
    resources = ["*"]
  }
  statement {
    actions   = ["ssm:*"]
    resources = ["*"]
  }
  statement {
    actions   = ["ssmmessages:*"]
    resources = ["*"]
  }
  statement {
    actions   = ["ec2messages:*"]
    resources = ["*"]
  }
  statement {
    actions   = ["sts:AssumeRole"]
    resources = [aws_iam_role.manager.arn]
  }

}

resource "aws_iam_policy" "manager_policy" {
  count  = length(var.manager_permissions) > 0 ? 1 : 0
  name   = join("-", ["EC2-Policy-${var.eks_manager_k8s_name}-EKS-Cluster", var.cluster_name])
  path   = "/"
  policy = data.aws_iam_policy_document.manager_policy[0].json
}

resource "aws_iam_role_policy_attachment" "manager_policy" {
  count      = length(var.manager_permissions) > 0 ? 1 : 0
  role       = aws_iam_role.manager.name
  policy_arn = aws_iam_policy.manager_policy[0].arn
}