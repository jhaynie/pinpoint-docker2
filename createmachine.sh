if [ -z "$AWS_ACCESS_KEY_ID"  ] || [ -z "$AWS_SECRET_ACCESS_KEY" ] || [ -z "$AWS_VPC_ID" ]; then
  echo "set vars AWS_ACCESS_KEY_ID , AWS_SECRET_ACCESS_KEY and AWS_VPC_ID"
  exit 1;
fi
if [ -z "$1" ]; then
	echo "missing argument. specify a machine name"
	exit 1;
fi

#--amazonec2-use-ebs-optimized-instance true
AWS_OPTS="--driver amazonec2 --amazonec2-instance-type t2.large --amazonec2-zone $AWS_SUBNET_ZONE --amazonec2-access-key $AWS_ACCESS_KEY_ID --amazonec2-secret-key $AWS_SECRET_ACCESS_KEY --amazonec2-vpc-id $AWS_VPC_ID --engine-opt dns=8.8.8.8"

echo "creating machine named $1"

docker-machine create $AWS_OPTS $1
