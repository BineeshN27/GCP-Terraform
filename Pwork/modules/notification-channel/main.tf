resource "google_monitoring_notification_channel" "notification_channel" {
  display_name = var.display_name
  type         = var.notification_type
  labels       = var.notification_labels
  force_delete = var.force_delete
}