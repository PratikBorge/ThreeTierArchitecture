module "vpc" {
    source = "/home/rocky/ThreeTierArchitecture/TerraformModule/Resources/VPC"
}
module "jenkins"{
   source = "/home/rocky/ThreeTierArchitecture/TerraformModule/Resources/JENKINS"
    public_subnet_id = module.vpc.public_subnet_id
    vpc_security_group_ids = module.vpc.vpc_security_group_ids
}
module "rds"{
    source = "/home/rocky/ThreeTierArchitecture/TerraformModule/Resources/RDS"
    subnet_ids = module.vpc.subnet_ids
    vpc_security_group_ids = module.vpc.vpc_security_group_ids
}
module "s3"{
    source = "/home/rocky/ThreeTierArchitecture/TerraformModule/Resources/S3bucket"
}
module "eks"{
    source = "/home/rocky/ThreeTierArchitecture/TerraformModule/Resources/EKS"
    public_subnet_ids = module.vpc.public_subnet_ids
}