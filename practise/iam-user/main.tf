resource "aws_iam_user" "user" {
  name = var.iam_user
}

resource "aws_iam_group" "group" {
    name = var.iam_group
}

resource "aws_iam_group_membership" "gp" {
  name  = "group-membership" 
  users = [aws_iam_user.user.name]
  group = aws_iam_group.group.name
}

resource "aws_iam_policy" "policy" {
  name = var.policy_name
  policy = file("policy.json")
}

resource "aws_iam_policy_attachment" "pa" {
  name = var.policy_attachment
  users = [aws_iam_user.user.name]
  groups = [aws_iam_group.group.name]
  policy_arn = aws_iam_policy.policy.arn
}