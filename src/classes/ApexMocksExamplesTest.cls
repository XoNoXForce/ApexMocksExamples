@isTest
private class ApexMocksExamplesTest
{
	private static final Fflib_ApexMocks MY_MOCKS = new Fflib_ApexMocks();

	@isTest
	static void test_selector_Order()
	{

		IOpportunitiesSelector mockOpportunitiesSelector = (IOpportunitiesSelector)MY_MOCKS.mock(OpportunitiesSelector.class);
		OpportunitiesSelector.setImpl(mockOpportunitiesSelector);

		IOpportunityLineItemsSelector mockOpportunityLineItemsSelector = (IOpportunityLineItemsSelector)MY_MOCKS.mock(OpportunityLineItemsSelector.class);
		OpportunityLineItemsSelector.setImpl(mockOpportunityLineItemsSelector);

		IContactsSelector mockContactsSelector = (IContactsSelector)MY_MOCKS.mock(ContactsSelector.class);
		ContactsSelector.setImpl(mockContactsSelector);

		ContactsService.API mockService = new MockContact();
		ContactsService.setImpl(mockService);

		Fflib_ISObjectUnitOfWork mockUoW = (Fflib_ISObjectUnitOfWork)MY_MOCKS.mock(fflib_SObjectUnitOfWork.class);

		ApexMocksExamples.unitOfWorkFactory.setMock(mockUoW);


		fflib_InOrder inOrder1 = new fflib_InOrder(MY_MOCKS, new List<Object>
			{
				mockOpportunitiesSelector, //the order of the mock instances in this list doesn't matter
				mockOpportunityLineItemsSelector,
				mockContactsSelector
			});


		ApexMocksExamples.ordering(new Set<ID>());

		((IOpportunitiesSelector)inOrder1.verify(mockOpportunitiesSelector, MY_MOCKS.calls(1))).selectById((Set<ID>)fflib_Match.anyObject());
		((IOpportunityLineItemsSelector)inOrder1.verify(mockOpportunityLineItemsSelector, MY_MOCKS.calls(1))).selectById((Set<ID>)fflib_Match.anyObject());
		((IContactsSelector)inOrder1.verify(mockContactsSelector, MY_MOCKS.calls(1))).selectById((Set<ID>)fflib_Match.anyObject());


		// Implement test code
	}

	@isTest
	static void test_UnitOfWork_order()
	{
		IOpportunitiesSelector mockOpportunitiesSelector = (IOpportunitiesSelector)MY_MOCKS.mock(OpportunitiesSelector.class);
		OpportunitiesSelector.setImpl(mockOpportunitiesSelector);

		IOpportunityLineItemsSelector mockOpportunityLineItemsSelector = (IOpportunityLineItemsSelector)MY_MOCKS.mock(OpportunityLineItemsSelector.class);
		OpportunityLineItemsSelector.setImpl(mockOpportunityLineItemsSelector);

		IContactsSelector mockContactsSelector = (IContactsSelector)MY_MOCKS.mock(ContactsSelector.class);
		ContactsSelector.setImpl(mockContactsSelector);

		ContactsService.API mockService = new MockContact();
		ContactsService.setImpl(mockService);

		Fflib_ISObjectUnitOfWork mockUoW = (Fflib_ISObjectUnitOfWork)MY_MOCKS.mock(fflib_SObjectUnitOfWork.class);

		ApexMocksExamples.unitOfWorkFactory.setMock(mockUoW);


		fflib_InOrder inOrder1 = new fflib_InOrder(MY_MOCKS, new List<Object>{
			mockUoW
		});

		ApexMocksExamples.ordering(new Set<ID>());


		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(2))).registerDirty(new Opportunity());


		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(1))).commitWork();
	}



	@isTest
	static void test_UnitOfWork_order_InStrictlyWay()
	{
		IOpportunitiesSelector mockOpportunitiesSelector = (IOpportunitiesSelector)MY_MOCKS.mock(OpportunitiesSelector.class);
		OpportunitiesSelector.setImpl(mockOpportunitiesSelector);

		IOpportunityLineItemsSelector mockOpportunityLineItemsSelector = (IOpportunityLineItemsSelector)MY_MOCKS.mock(OpportunityLineItemsSelector.class);
		OpportunityLineItemsSelector.setImpl(mockOpportunityLineItemsSelector);

		IContactsSelector mockContactsSelector = (IContactsSelector)MY_MOCKS.mock(ContactsSelector.class);
		ContactsSelector.setImpl(mockContactsSelector);

		ContactsService.API mockService = new MockContact();
		ContactsService.setImpl(mockService);

		Fflib_ISObjectUnitOfWork mockUoW = (Fflib_ISObjectUnitOfWork)MY_MOCKS.mock(fflib_SObjectUnitOfWork.class);

		ApexMocksExamples.unitOfWorkFactory.setMock(mockUoW);


		fflib_InOrder inOrder1 = new fflib_InOrder(MY_MOCKS, new List<Object>{
			mockUoW
		});


		ApexMocksExamples.ordering(new Set<ID>());

		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(1))).registerDirty( new Opportunity());

		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(2))).registerNew(new List<Contact>());


		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(1))).registerNew(new Opportunity());

		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(1))).registerDirty( new Opportunity());

		((Fflib_ISObjectUnitOfWork) inOrder1.verify(mockUoW, MY_MOCKS.calls(1))).commitWork();
	}


	private class MockContact implements ContactsService.API
	{
		public List<Contact> sendEmailAndDoOtherStuff(Set<Id> cotactsIds, List<OpportunityLineItem> oppLines, List<Contact> contacts)
		{
			return null;
		}
	}
}