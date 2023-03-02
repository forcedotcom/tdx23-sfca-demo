public class KnownUnexpectedErrorExample {
	@AuraEnabled
	public static void doSomething(String className) {
        String jsonBatchJob;
        BatchJob batchJob = getBatchJob(className);
        System.debug(batchJob);
    }
	 public BatchJob getBatchJob(String className) {
        AsyncApexJob batchJob = getAsyncApexJob(null);
        return batchJob == null ? null : new BatchJob(batchJob);
    }
	public AsyncApexJob getAsyncApexJob(String className) {
        List<AsyncApexJob> apexJobs = getAsyncApexJobs(className, 1);
        return apexJobs.isEmpty() ? null : apexJobs[0];
    }
	public AsyncApexJob getAsyncApexJob(Id jobId) {
		List<AsyncApexJob> apexJobs = [
            SELECT
               Status, ApexClass.Name,
                CreatedDate, CompletedDate
            FROM AsyncApexJob
            WHERE Id = :jobId
            LIMIT 1
        ];
        return apexJobs.isEmpty() ? null : apexJobs[0];
	}
	public List<AsyncApexJob> getAsyncApexJobs(String className, Integer jobCounts) {
        return [
            SELECT
                Status, ApexClass.Name,
                CreatedDate, CompletedDate
            FROM AsyncApexJob
            WHERE JobType = :JOB_TYPE_BATCH
                AND ApexClass.Name = :className
            LIMIT : jobCounts
        ];
    }
}