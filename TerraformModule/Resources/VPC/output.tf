output "public_subnet_id" {
    value = aws_subnet.public.id
}
output "private_subnet_id" {
    value = aws_subnet.private.id
}
output "private2_subnet_id" {
    value = aws_subnet.private2.id
}
output "subnet_ids"{
    value = [aws_subnet.private.id, aws_subnet.private2.id]
}
output "vpc_security_group_ids"{
    value = [aws_security_group.this_sg.id, aws_default_security_group.default.id ]
}
output "public_subnet_ids" {
    value = [aws_subnet.public.id, aws_subnet.public2.id]
}
output "vpc_id" {
    value = aws_vpc.this_vpc.id
}