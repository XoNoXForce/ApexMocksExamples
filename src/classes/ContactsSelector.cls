public with sharing class ContactsSelector extends fflib_SObjectSelector implements IContactsSelector
{
	private static IContactsSelector selectorImpl = null;

	public ContactsSelector() {
		super(false);
	}

	public static IContactsSelector newInstance()
	{
		if(selectorImpl == null)
		{
			return new ContactsSelector();
		}

		return selectorImpl;
	}

	public static void setImpl(IContactsSelector impl)
	{
		selectorImpl = impl;
	}

	public List<Schema.SObjectField> getSObjectFieldList() {
		return new List<Schema.SObjectField> {
			 };
	}

	public Schema.SObjectType getSObjectType() {
		return Contact.sObjectType;
	}

	public List<Contact> selectById(Set<Id> idSet) {
		return (List<Contact>) selectSObjectsById(idSet);
	}
}