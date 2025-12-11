env="dev"
ami = "ami-09c813fb71547fc4f"
#
zone_id =  "Z055196614WSVQYU4VYMA"
db_component = {
  mongodb = {
    port = {ssh = 22 , mdb = 27017}
    instance_type = "t3.micro"
  }
  redis = {
    port = {ssh = 22 , rdb = 6379 }
    instance_type = "t3.micro"
  }
   mysql = {
    port = { ssh= 22 , app = 3306 }
    instance_type = "t3.micro"
  }

  rabbitmq = {
    port = { ssh= 22 , app = 5672 }
    instance_type = "t3.micro"
  }

}