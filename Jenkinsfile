pipeline {
    agent { label 'drs-dc2-robot-1||drs-dc2-robot-2' }
    stages {
        stage('Pull Test Scripts') {
            steps {
                cleanWs()
                git branch: 'dev', credentialsId: 'drs-ci-user-git', url: 'https://git.alm.set/drs/etfs/etfs-robot.git'
            }
        }
        stage('Run Test Case') {
            steps {
                retry(1) {
                    sleep 1
                    sh '''#!/bin/bash -xe
                        docker run --rm --network selenium-hub-network \
                            -v $WORKSPACE:/opt/robotframework/tests:Z \
                            -v $WORKSPACE/Reports/$JOB_BASE_NAME:/opt/robotframework/tests/Reports/$JOB_BASE_NAME:Z \
                            -v $WORKSPACE/Keywords/$JOB_BASE_NAME:/opt/robotframework/tests/Keywords/$JOB_BASE_NAME \
                            -v $WORKSPACE/Variables/$JOB_BASE_NAME:/opt/robotframework/tests/Variables/$JOB_BASE_NAME \
                            -v $WORKSPACE/TestSuites/$JOB_BASE_NAME:/opt/robotframework/tests/TestSuites/$JOB_BASE_NAME \
                            -v /dev/shm:/dev/shm \
                            -e http_proxy=http://pxs.set:80 \
                            -e https_proxy=http://pxs.set:80 \
                            -e ROBOT_OPTIONS=\"-d /opt/robotframework/tests/Reports/$JOB_BASE_NAME -v SERVER:10.22.68.64 -s $JOB_BASE_NAME\" \
                            -e BROWSER=chrome \
                            -e TZ=Asia/Bangkok \
                            tumit/robotframework-mssql:1.1
                    '''
                }
            }
        }
    }
    post {
        always {
            step([
                $class              : 'RobotPublisher',
                outputPath          : "Reports/$JOB_BASE_NAME",
                outputFileName      : 'output.xml',
                reportFileName      : 'report.html',
                logFileName         : 'log.html',
                disableArchiveOutput: false,
                passThreshold       : 100,
                unstableThreshold   : 95,
                otherFiles          : "**/*.png,**/*.jpg",
            ])
        }
    }
}
