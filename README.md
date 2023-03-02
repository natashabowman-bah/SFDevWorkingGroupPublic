## Commands used
Create scratch org:

sfdx force:org:create -f config/project-scratch-def.json -a demo01 --setdefaultusername

Push to scratch org:

sfdx force:source:push

## Steps for Activity 2
PreReqs: Activity 1 completed

1. Open VSCode with your existing project folder
2. Sign up for a developer org (or if you have requested sfdx permissions in VAPM via an RSR that works too)
3. For personal developer org, go to setup and enable DevHub
4. If VAPM, change the login url in the sfdx-project.json to be vapm.my.salesforce.com instead of login.salesforce.com
5. Next we need to authenticate DevHub for scratch org creation
   sfdx auth:web:login -d -a DevHub
   If you missed the -d step, you can set the DevHub config via sfdx force:config:set defaultdevhubusername=DevHub
6. create scratch org: sfdx force:org:create -f config/project-scratch-def.json -a demo01
7. deploy: sfdx force:source:deploy -p force-app -u demo01
8. open the org and play around like normal with: sfdx force:org:open -u demo01
9. Make a custom object called "<FirstName>_<LastName>__c", add no fields.
10. sfdx force:source:retrieve -m "CustomObject:<FirstName>_<LastName>__c" -u demo01
11. verfy the new object exists locally.
12. add, commit, and push changes to your existing branch. confirm the changes show up in your PR.


## Steps for Activity 1
PreReqs:
Download Git
Navigate the the SFDevWorkingGroup repo

https://git-scm.com/download/win

Navigate to the green "Code" dropdown


Navigate to the 'Code' dropdown and HTTPS tab

Copy the address shown

Navigate to VSCode

Clone in VSCode using the git clone command

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


