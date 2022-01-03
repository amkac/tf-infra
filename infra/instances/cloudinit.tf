data "template_file" "init-script" {
  template = file(var.PATH_TO_USER_DATA)
}

data "template_cloudinit_config" "cloudinit-example" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.init-script.rendered
  }

  #init schema
  part {
    content_type = "text/x-shellscript"
    content      = <<-EOF
    #!/bin/bash
    mysql --host=${var.RDS_ENDPOINT} --user=root --password=mypassword1993 < ./scripts/schema.sql
    EOF
  }

}

