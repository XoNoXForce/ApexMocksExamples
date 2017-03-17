public with sharing class OpportunityLineItemsSelector extends fflib_SObjectSelector implements IOpportunityLineItemsSelector
{
	private static IOpportunityLineItemsSelector selectorImpl = null;

	public OpportunityLineItemsSelector() {
		super(false);
	}

	public static IOpportunityLineItemsSelector newInstance()
	{
		if(selectorImpl == null)
		{
			return new OpportunityLineItemsSelector();
		}

		return selectorImpl;
	}

	public static void setImpl(IOpportunityLineItemsSelector impl)
	{
		selectorImpl = impl;
	}

	public List<Schema.SObjectField> getSObjectFieldList() {
		return new List<Schema.SObjectField> {
			 };
	}

	public Schema.SObjectType getSObjectType() {
		return OpportunityLineItem.sObjectType;
	}

	public List<OpportunityLineItem> selectById(Set<Id> idSet) {
		return (List<OpportunityLineItem>) selectSObjectsById(idSet);
	}
}