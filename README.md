## Commands used
Create scratch org:

sfdx force:org:create -f config/project-scratch-def.json -a demo01 --setdefaultusername

Push to scratch org:

sfdx force:source:push


## Steps for Week 1
PreReqs:
Connect to the VPN
Download Git
Navigate the the SFDevGroup repo

https://git-scm.com/download/win

Navigate to the green "Code" dropdown

Choose the SSH Tab

Begin the SSH Key Generation process

Navigate to your settings

Select 'SSH and GPG keys'

Generate new SSH Key

Add a new SSH Key

Add a New SSH Key

Navigate back to repo, back to the 'Code' dropdown and SSH tab

Copy the address shown

Navigate to VSCode

*where Devlin started* Clone in VSCode using the git clone command

git clone [addressCopied]


Create New Branch from Main using the new branch command

git checkout -b [yourBranchName] main


Create Apex Class in VSCode that uses System.debug() to print your name

Run the add command to add all files to stage for commit

git add -A

Commit the class using the commit command

git commit -a -m "[messageAboutCommit]"

Push using the push command

git push origin [yourBranchName]

Navigate to the repo and find your commit

Create a Pull Request and Assign a Reviewer to it (Ensure you're creating a PR against main)

Once the branch is deleted, you will need to create a new branch and pull from main to begin new work

Bonus: sign up for a Developer Org to begin setting up and playing with scratch orgs :)


