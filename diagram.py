from diagrams import Diagram, Cluster
from diagrams.onprem.container import Docker
from diagrams.generic.network import Firewall
from diagrams.aws.management import Cloudwatch, ParameterStore
from diagrams.aws.storage import EFS
from diagrams.generic.blank import Blank

with Diagram("AWS ECS Task Definition", show=False, direction="TB"):

    with Cluster("task definition"):
        image = Docker("image")
        ports = Firewall("ports")
        logging = Cloudwatch("logging")
        environment = Blank("environment")
        secrets = ParameterStore("secrets")
        health_check = Blank("health check")
        mount_points = EFS("mount points")
