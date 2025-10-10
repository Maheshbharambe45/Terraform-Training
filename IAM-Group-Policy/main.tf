resource "aws_iam_user" "user" {
    name = var.iam_username
}

resource "aws_iam_group" "developers"{
    name = var.iam_Groupname
}

resource "aws_iam_policy" "mypolicy" {
    name = var.iam_policy
    policy = file("policy.json")
}

resource "aws_iam_user_group_membership" "membership" {
    user   = aws_iam_user.user.name
    groups = [aws_iam_group.developers.name]
}

resource "aws_iam_policy_attachment" "attach" {
    name = var.policy_attachment
    groups = [aws_iam_group.developers.name]
    policy_arn = aws_iam_policy.mypolicy.arn
}



