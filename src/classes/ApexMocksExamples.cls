public with sharing class ApexMocksExamples
{

	public static final List<Schema.SObjectType> SOBJECTTYPES =
			new List<Schema.SObjectType>
			{
				Opportunity.SObjectType,
				OpportunityLineItem.SObjectType,
				Contact.SObjectType
			};

	public static final fflib_Application.UnitOfWorkFactory unitOfWorkFactory =
		new fflib_Application.UnitOfWorkFactory(SOBJECTTYPES);

	public static void ordering(Set<Id> opportunityId)
	{

		fflib_ISObjectUnitOfWork unitOfWork = unitOfWorkFactory.newInstance();

		//load some data
		List<Opportunity> opportunities = OpportunitiesSelector.newInstance().selectById(new Set<Id>());
		List<OpportunityLineItem> oppLines = OpportunityLineItemsSelector.newInstance().selectById(new Set<Id>());
		List<Contact> contacts = ContactsSelector.newInstance().selectById(new Set<Id>());

		//create email for contacts and update

		ContactsService.sendEmailAndDoOtherStuff(new Set<Id> (), oppLines, contacts);

		//save

		unitOfWork.registerDirty(new Opportunity());

		unitOfWork.registerNew(new List<Contact>());
		unitOfWork.registerNew(new List<Contact>());

		unitOfWork.registerNew(new Opportunity());

		unitOfWork.registerDirty(new Opportunity());
		unitOfWork.registerDirty(new Opportunity());

		unitOfWork.commitWork();
	}

	public static void answer(Set<Id> opportunityId)
	{
		//load opportunities

		//load oppLines

		//load contacts

		//create email for contacts and update

		//save contacts
	}

	public static void capture(Set<Id> opportunityId)
	{
		//load opportunities

		//load oppLines

		//load contacts

		//create email for contacts and update

		//save contacts
	}
}