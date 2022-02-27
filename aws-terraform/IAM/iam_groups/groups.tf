# Group Membership

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user_one.name,
    aws_iam_user.user_two.name,
  ]

  group = aws_iam_group.qa.name
}

# Group name

resource "aws_iam_group" "qa" {
  name = "qa"
  path = "/users/"
}

# Users

resource "aws_iam_user" "user_one" {
  name = "jack.anthony"
}

resource "aws_iam_user" "user_two" {
  name = "jill.andrews"
}

resource "aws_iam_group_policy" "my_qa_policy" {
  name  = "my_developer_policy"
  group = aws_iam_group.qa.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
