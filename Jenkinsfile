pipeline {
	  agent {
		kubernetes {
		  label 'jenkins-slave'
		}
	  }   
	  stages {  
		stage('Test') {          	
			failFast true    
			parallel {
				stage("Unit Tests") {
					steps {
						container('maven') {
						  sh 'mvn test' 
						}
					 } 
					post {  
						always { 
							junit testResults: '**/target/surefire-reports/TEST-*Test.xml', allowEmptyResults: true
						}
					}
				} 
				stage("Integration Tests") {
					steps {						     
						container('maven') {  
						  sh 'mvn verify -DskipUTs'  
						}
					} 
					post { 
						always { 
							junit testResults: '**/target/failsafe-reports/TEST-*IT.xml', allowEmptyResults: true   
						}
					}
				}							
			}      	
		}   
		stage("Build") {
			steps {
				container('maven') {
					sh 'mvn dockerfile:build -DskipTests=true  '
				}
			 }
		}  
		stage("Push") {
			steps {
				container('maven') {
					sh 'mvn dockerfile:push'  
				}
			 }
		} 	
		
		
	 
		 
		

	  }
	}
}
