provider "google" {
 access_token = var.access_token
 project = "airline1-sabre-wolverine"
}

resource "google_project_iam_policy" "project" {
  project     = "airline1-sabre-wolverine"
  policy_data = "${data.google_iam_policy.admin.policy_data}"
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/compute.admin"

    members = [
      "user:nrayavaram@google.com",
    ]

    condition {
      title       = "expires_after_2019_12_31"
      description = "Expiring at midnight of 2019-12-31"
      expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
    }
  }
}
