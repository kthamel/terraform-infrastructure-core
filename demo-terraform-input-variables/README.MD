##If you want to export the value for just "user" you have to export it as below. If you export it as just user, its not working.##

export TF_VAR_user="kushan.thamel@abc.com"

This is bit odd one, best thing is create a "vars.rfvars" file, and then place the variables inside this file. For an example,

user = "kushan.thamel@abc.com"

If you want to override the default variables from prefered values, you can run the terraform plan command as below. And you have to keep on mind to pass the same values when  you run the terraform apply as well.

terraform plan -var user="kushan@abc.com"  <-- plan

terraform apply -var user="kushan@abc.com" <-- apply
