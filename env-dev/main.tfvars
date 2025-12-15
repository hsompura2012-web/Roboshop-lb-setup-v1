env="dev"
ami = "ami-09c813fb71547fc4f"
#
zone_id =  "Z055196614WSVQYU4VYMA"
instance_type = "t3.micro"
default_vpc_id = "vpc-096bed7d534ee6e34"

subnets = ["subnet-04f731d9f5e3fd657","subnet-0ac38475a998558e7"]

db_component = {
  mongodb = {
    port = {ssh = 22 , mdb = 27017}
     }
  redis = {
    port = {ssh = 22 , rdb = 6379 }
    }
   mysql = {
    port = { ssh= 22 , app = 3306 }
     }

  rabbitmq = {
    port = { ssh= 22 , app = 5672 }
     }

}
app_component = {
  frontend = {
    port = { ssh = 22, app = 8080 }
    max_size           = 10
    min_size           = 1
     }
  catalogue = {
    port = { ssh = 22, app = 8080 }
    max_size           = 10
    min_size           = 1
  }
 user = {
   port = { ssh = 22, app = 8080 }
   max_size = 10
   min_size = 1
 }
  cart = {
    port = { ssh = 22, app = 8080 }
    max_size           = 10
    min_size           = 1
  }
  shipping = {
    port = { ssh = 22, app = 8080 }
    max_size           = 10
    min_size           = 1
  }

  }