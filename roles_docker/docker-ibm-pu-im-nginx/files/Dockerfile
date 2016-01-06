FROM centos:6.6

MAINTAINER Aerus

# Install basic packages
RUN yum -y update \
    && yum install -y wget tar openssh-server unzip gtk2 libXtst dejavu-sans-fonts \
    && yum clean all

ADD ibm_pu_im_package.zip /tmp/_ibm/
RUN unzip -q /tmp/_ibm/ibm_pu_im_package.zip -d /tmp/_ibm/ \
    && rm -f /tmp/_ibm/ibm_pu_im_package.zip

ADD response_file_PU.xml /tmp/_ibm/

WORKDIR /tmp/_ibm/disk_linux.gtk.x86_64/InstallerImage_linux.gtk.x86_64/tools
RUN ./imcl input /tmp/_ibm/response_file_PU.xml -log /tmp/_ibm/install_log.xml -acceptLicense

WORKDIR /tmp
RUN rm -rf /tmp/_ibm

CMD ["/opt/IBM/PackagingUtility/IBMPU"]
