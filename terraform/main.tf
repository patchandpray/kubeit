provider "google" {
    credentials = "${file("terraform_credentials.json")}"
    region = "${var.region}"
    project = "${var.project}"
}
