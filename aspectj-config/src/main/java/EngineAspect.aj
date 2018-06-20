import framework.Engine;

public aspect EngineAspect{

	long startTime;
	//AGT compiler - Post compilation 
	pointcut callEngineAspectPointcut() : 
		call(void framework.Engine.run(..));
	
	before() throws Exception : callEngineAspectPointcut() {
		// get list of parameters to the method being called
			startTime = System.currentTimeMillis();
			Thread.sleep(1000);
			System.out.println("Method execution started..startTime = " + startTime);		
	}
	
	after() throws Exception : callEngineAspectPointcut(){
		Thread.sleep(1000);
		long endTime = System.currentTimeMillis() - startTime;
		System.out.println("Method execution completed in "+ endTime + " ms");
	}
	
}