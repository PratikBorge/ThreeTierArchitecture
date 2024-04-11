module "vpc" {
    source = "/mnt/c/Users/pratik/Desktop/THREEMODULE/TerraformModule/Resources/VPC"
}
module "jenkins"{
   source = "/mnt/c/Users/pratik/Desktop/ThreeModule/TerraformModule/Resources/JENKINS"
    public_subnet_id = module.vpc.public_subnet_id
    vpc_security_group_ids = module.vpc.vpc_security_group_ids
}
module "rds"{
    source = "/mnt/c/Users/pratik/Desktop/ThreeModule/TerraformModule/Resources/RDS"
    subnet_ids = module.vpc.subnet_ids
    vpc_security_group_ids = module.vpc.vpc_security_group_ids
}
module "s3"{
    source = "/mnt/c/Users/pratik/Desktop/ThreeModule/TerraformModule/Resources/S3bucket"
}
module "eks"{
    source = "/mnt/c/Users/pratik/Desktop/ThreeModule/TerraformModule/Resources/EKS"
    public_subnet_ids = module.vpc.public_subnet_ids
}