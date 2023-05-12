public with sharing class JesseService extends ZD_VirtualCallable {
	public override Object doCall(String action, Map<String, Object> args) {
		switch on action {
			when 'setname' {
				List<SObject> records = (List<SObject>) args.get('records');
				this.setName(records);
			}
			when 'gettimestamp' {
				return System.now();
			}
		}
		return null;
	}

	@TestVisible
	private void setName(List<SObject> records) {
		for (SObject record : records) {
			DateTime timeStamp = (DateTime) this.call('getTimeStamp');
			record.put('Name', 'Jesse - ' + timeStamp);
		}
	}
}
