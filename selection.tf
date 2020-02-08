resource "aws_backup_plan" "rds_backup" {
  name = "${var.rds_id}_backup_plan"

  rule {
    rule_name         = "${var.rds_id}_rds_backup_rule"
    target_vault_name = aws_backup_vault.rds-backup.name
    schedule          = "cron(00 15 * * ? *)"
  }
}

resource "aws_backup_selection" "rds_backup" {
  iam_role_arn = aws_iam_role.rds_backup.arn
  name         = "${var.rds_id}_backup_selection"
  plan_id      = aws_backup_plan.rds_backup.id

  resources = [
    var.rds_arn,
  ]
}

