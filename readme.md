Terraform Important Commands

Initialization
 • terraform init
 • terraform plan
 • terraform apply
 • terraform destroy
  ○ terraform destroy -target=RESOURCE_ADDRESS
 • terraform apply -target=RESOURCE_ADDRESS

Viewing State
 • terraform show
 • terraform state list
 • terraform state show RESOURCE_ADDRESS

Managing State
 • terraform state rm RESOURCE_ADDRESS
 • terraform state mv SOURCE_RESOURCE DEST_RESOURCE

Importing Existing Infrastructure
 • terraform import RESOURCE_ADDRESS ID

Formatting and Validating
 • terraform fmt
 • terraform validate

Output and Variables
 • terraform output
 • terraform output OUTPUT_NAME

Workspaces
 • terraform workspace list: Lists all workspaces.
 • terraform workspace show: Shows the current workspace.
 • terraform workspace new WORKSPACE_NAME: Creates a new workspace.
 • terraform workspace select WORKSPACE_NAME: Switches to the specified workspace.
 • terraform workspace delete WORKSPACE_NAME: Deletes the specified workspace.

Locking and Unlocking
 • terraform force-unlock LOCK_ID: Manually unlocks the state if the automatic unlocking process fails.

Miscellaneous
 • terraform version: Displays the current Terraform version.
 • terraform providers: Lists the providers used in the configuration and their versions.
 • terraform graph: Generates a visual representation of the Terraform configuration in Graphviz format.
