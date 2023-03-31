## Commands reference
https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_top.htm

## Trigger Action Framework Tutorial
https://www.apexhours.com/trigger-actions-framework/


## Steps for Activity 3
PreReqs: Activity 2 completed

1. Open VSCode with your existing project folder
2. create scratch org: 
    sfdx force:org:create -f config/project-scratch-def.json -a act03
    OR
    sf org create scratch -f config/project-scratch-def.json -a act03
3. Install the trigger actions framework unlocked package
    sfdx force:package:install --package "04t3h000004VaHaAAK" -r -w 10 -u act 03
    or
    sf package install -p "04t3h000004VaHaAAK" -r -w 10 -o act03
4. deploy the project
    sfdx force:source:deploy -p force-app -u act03
    OR
    sf deploy metadata -d force-app -o act03
5. open your org
    sfdx force:org:open -u act03
    OR
    sf org open -o act03
6. From setup, go to custom metadata types
7. Click "manage records" for sObject Trigger setting and add an entry for your object from activity 2. Only worry about required fields today.
8. go back to custom metadata types
9. Click "manage records" for Trigger Actions and add an entry labeled "YOUR NAME - Before Insert". For load order, enter 1. For the apex class name, use YourName_BeforeInsert. Under the before insert lookup, select your metadata from step 8. add a description and click save.
10. retrieve the custom metadata from the org to your local
    sfdx force:source:retrieve -m "CustomMetadata" -u act03
    OR
    sf retrieve metadata -m "CustomMetadata" -o act03
11. on the triggers folder, right click and create a new trigger. Name it "YourNameTrigger". 
12. Change the trigger on SOBJECT to be your sobject. add all of the trigger events. (before insert, after insert, before update, after update, after delete, after undelete). 
13. Add one line of code to this trigger-> new MetadataTriggerHandler().run(); (See the JonDevlinTrigger as an example)
14. create a new class named YourName_BeforeInsert (same as the class name in step 9).
15. add implements TriggerAction.BeforeInsert to your class name (see JonDevlin_BeforeInsert class example)
15. add a beforeInsert method that accepts a list of Sobjects. in that method, iterate over all of them and set the name field equal to the string value of your name + the current date. (see JonDevlin_BeforeInsert class example).
16. deploy the entire project back to the org:
    sfdx force:source:deploy -p force-app -u act03
    OR
    sf deploy metadata -d force-app -o act03
17. insert a record in the anonymous window in your object: insert(new Your_name__c())
18. query the record in dev console to confirm the name matches what was done in your trigger. [SELECT Name FROM your_name__c];


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


