# powerline-chef-apiserver

TODO: Enter the cookbook description here.

## Packaging for Use

After you have completed your work, you'll need to upload the cookbook(s) to s3. Given the opsworks limitations on using berks and resolving dependencies, this is the recommended way to handled getting our cookbooks to opsworks. 
I'll assume you have the right aws creds in the right location to use the aws cli (`s3`).

```bash
$ ./upload_cookbook.sh PACKNAME
```

This will drop someting like `api-server.tar.gz` into `s3://deployment-data/chef`
