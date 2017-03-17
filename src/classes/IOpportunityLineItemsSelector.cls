public interface IOpportunityLineItemsSelector {

	List<OpportunityLineItem> selectById(Set<Id> idSet);
}