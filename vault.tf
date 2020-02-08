resource "aws_backup_vault" "rds-backup" {
  name = "${var.rds_id}_backup_vault"
}

