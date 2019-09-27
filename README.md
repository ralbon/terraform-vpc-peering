# VPC peering terraform module

This module aims at creating a peeering between 2 VPC (VPC A and VPC B) including: 
- Internal VPCs
- VPCs with on-premise connectivity. 
https://cloud.google.com/vpc/docs/vpc-peering#transit_for_on-premises_connectivity


## Variables

| Name                          | Mandatory | default value | Description                                     |
|-------------------------------|-----------|---------------|-------------------------------------------------|
| `PROJECT_ID`                  | yes       | -             | The GCP project id                              | 
| `REGION`                      | no        | europe-west1  | The region where the resources will be created. |
| `VPC_PEERS`                   | yes       | -             | The list of vpc object to be peered             |

| `VPC_PEERS`                   | Description                                     |
|-------------------------------|-------------------------------------------------|
| `vpc_name_a`                  | The name of VPC A                               |
| `project_id_a`                | The project id of VPC A                         |
| `vpc_name_b`                  | The name of VPC B                               |
| `project_id_b`                | The project id of VPC B                         |
| `is_transitive_to_on_premise` | If VPCs with on-promise connectvity is required set true. **Please note that VPC A will export routes and VPC B will import routes** |


## Example
```
VPC_PEERS = [
    {
        vpc_name_a = "network1"
        project_id_a = "network1-6b62d8f7"
        vpc_name_b = "network2"
        project_id_b = "network2-418f948a"
        is_transitive_to_on_premise = true
    },
    {
        vpc_name_a = "network3"
        project_id_a = "network3-6b62d8f7"
        vpc_name_b = "network4"
        project_id_b = "network4-6ddadf66"
        is_transitive_to_on_premise = false
    }
]
```
