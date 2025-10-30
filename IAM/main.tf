resource "aws_iam_user" "user" {
  name = var.user_name
}

resource "aws_iam_group" "group" {
  name = var.Group_name
}

resource "aws_iam_policy" "policy" {
  name = var.policy_name
  policy = file("policy.json")
}

resource "aws_iam_group_membership" "membership" {
    name = var.policy_attachment
    users = [aws_iam_user.user.name]
    group = aws_iam_group.group.name
}

resource "aws_iam_policy_attachment" "my-policy-attachment" {
    name = var.policy_attachment
    groups = [aws_iam_group.group.name]
    policy_arn = aws_iam_policy.policy.arn
}