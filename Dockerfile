# dockerfile to build image for JBoss EAP 7.2 

#start from eap72-openshift
FROM registry.access.redhat.com/jboss-eap-7/eap72-openshift

# file author / maintainer
MAINTAINER "Diego Gean da Fé" "dafediegogean@gmail.com"

# Copy war to deployments folder
COPY app.war $JBOSS_HOME/standalone/deployments/

# User root to modify war owners
USER root

# Modify owners war
RUN chown jboss:jboss $JBOSS_HOME/standalone/deployments/app.war

# Important, use jboss user to run image
USER jboss
