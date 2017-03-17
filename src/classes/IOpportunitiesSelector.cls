public interface IOpportunitiesSelector {

	List<Opportunity> selectById(Set<Id> idSet);
}