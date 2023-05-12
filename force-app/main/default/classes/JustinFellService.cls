public with sharing class JustinFellService extends zd_virtualCallable{
    public JustinFellService() {

    }
    public override Object doCall(String Action, map<String, Object> args){
        switch on Action{
            when 'setname'{
                List<SObject> records = (List<SObject>)args.get('records'); 
                this.setName(records);
            }
            when 'gettimestamp'{
                return system.now();
            }
        }
        return null;
    }
    @testVisible
    private void setName(List<SObject> records){
        for(SObject record: records){
            Datetime timeStamp = (Datetime) this.Call('getTimeStamp');
            record.put('Name', 'Justin Fell - ' + timeStamp);
        }
    }
}