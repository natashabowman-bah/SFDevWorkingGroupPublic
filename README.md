## Commands reference
https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_top.htm

## Trigger Action Framework Tutorial
https://www.apexhours.com/trigger-actions-framework/

## Steps for Activity 5
PreReqs: Activity 4 completed
1. update cli to ensure you have the sf commands
    ```
    sfdx update
    ```
2. create scratch org: 
    ```
    sf org create scratch -f config/project-scratch-def.json -a act05
    ```
3. install ZDF
    ```
    sf package install --package "ZDF" -w 5 -o act05
    ```
4. install trigger actions framework
   ```
   sf package install -p "TAF" -r -w 10 -o act05
   ```
5. Add a new test in your service test class based off of the testSetName test from last session. In that test, Mock the getTimeStamp call in your Service class (such as JonDevlinServiceTest) to return System.now().addDays(7) instead of System.now(). The syntax to mock a return value is below:
   ```
    ZD_VirtualCallable svc = new JonDevlinService();
    ZD_Application.startMocking();
    DateTime mockedTS = System.now().addDays(7);
    svc.when('getTimeStamp').thenReturn(mockedTS);
    ZD_Application.stopMocking();
   ```
   NOTE: this week we are casting the svc as a ZD_VirtualCallable. Doing so allows us access to the methods virtual callable has. We need access to the mocking methods specifically.
6. change the assertions to be based off of this mocked timestamp instead of the actual one
7. deploy your new test to the org via the cli
8. run the test via the cli and confirm a passing test:
run the test from the cli
```
sf apex run test --class-names "JonDevlinServiceTest" --result-format human --code-coverage -w 2 -o act05 
```

## Steps for Activity 4
PreReqs: Activity 3 completed
1. update cli to ensure you have the sf commands
    ```
    sfdx update
    ```
2. create scratch org: 
    ```
    sf org create scratch -f config/project-scratch-def.json -a act04
    ```
3. install ZDF
    ```
    sf package install --package "ZDF" -w 5 -o act04
    ```
4. install trigger actions framework
   ```
   sf package install -p "TAF" -r -w 10 -o act04
   ```
5. create a new Apex class in the classes directory named <YOURNAME>Service, and have it extend the ZD_VirtualCallable class
6. implement the doCall method in this class, and have it check for an action name of "setname<yourname>" (all lower case). also have it return the current timestamp when the 'gettimestamp' action is called.see below for a generic example:
    ```
    public override Object doCall(String action, Map<String,Object> args){
            switch on action {
                when 'actionnamereplaceme' {
                    List<SObject> records = (List<ZD_Record>) args.get('records');
                    this.actionNameReplaceMe(records);
                }
                when 'gettimestamp' {
                    return System.now();
                }
            }
            return null;
        }
    ```
7. Implement the setName<YourName> method with similar logic from activity 3:
```
    @TestVisible
    private void setName(List<SObject> records){
        for(SObject record : newList){
            DateTime timeStamp = (DateTime) this.call('getTimeStamp');
            record.put('Name', 'Jon Devlin 2 - ' + timeStamp);
        }
    }
```
8. In your before insert class from activity 3, swap out the logic for this:
```
    System.Callable svc = new <YOURNAME>Service();
    svc.call('setName', new Map<String,Object>{'records' => newList});
```
9. create a test class for your service YOURNAMEServiceTest
10. add a testSetName unit test method (see JonDevlinServiceTest for example)
    ```
    public static void testSetName(){
            JonDevlin__c jd = new JonDevlin__c();
            List<SObject> recordList = new List<SObject>{jd};
            System.Callable svc = new JonDevlinService();
            svc.call('setName', new Map<String,Object>{'records' => recordList});
            Assert.areEqual('Jon Devlin - ' + System.now(), jd.Name);
        }
    ```
11. deploy to the scratch org using the commands we have used
12. run the test from the cli
```
sf apex run test --class-names "JonDevlinServiceTest" --result-format human --code-coverage -w 2 -o act04 
```


## Steps for Activity 3
PreReqs: Activity 2 completed

1. Open VSCode with your existing project folder
2. create scratch org: 
    ```
    sfdx force:org:create -f config/project-scratch-def.json -a act03
    ```
    OR
    ```
    sf org create scratch -f config/project-scratch-def.json -a act03
    ```
3. Install the trigger actions framework unlocked package
    ```
    sfdx force:package:install --package "TAF" -r -w 10 -u act 03
    ```
    or
    ```
    sf package install -p "TAF" -r -w 10 -o act03
    ```
4. deploy the project
    ```
    sfdx force:source:deploy -p force-app -u act03
    ```
    OR
    ```
    sf deploy metadata -d force-app -o act03
    ```
5. open your org
    ```
    sfdx force:org:open -u act03
    ```
    OR
    ```
    sf org open -o act03
    ```
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


