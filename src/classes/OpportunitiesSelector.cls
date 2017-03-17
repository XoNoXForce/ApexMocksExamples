public with sharing class OpportunitiesSelector extends fflib_SObjectSelector implements IOpportunitiesSelector
{
	private static IOpportunitiesSelector selectorImpl = null;

	public OpportunitiesSelector() {
		super(false);
	}

	public static IOpportunitiesSelector newInstance()
	{
		if(selectorImpl == null)
		{
			return new OpportunitiesSelector();
		}

		return selectorImpl;
	}

	public static void setImpl(IOpportunitiesSelector impl)
	{
		selectorImpl = impl;
	}

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
             };
    }

    public Schema.SObjectType getSObjectType() {
        return Opportunity.sObjectType;
    }

    public List<Opportunity> selectById(Set<Id> idSet) {
        return (List<Opportunity>) selectSObjectsById(idSet);
    }
}