FROM centos:base

RUN echo '[google-chrome]' > /etc/yum.repos.d/google-chrome.repo \
    && echo 'name=google-chrome' >> /etc/yum.repos.d/google-chrome.repo \
    && echo 'baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64' >> /etc/yum.repos.d/google-chrome.repo \
    && echo 'enabled=1' >> /etc/yum.repos.d/google-chrome.repo \
    && echo 'gpgcheck=1' >> /etc/yum.repos.d/google-chrome.repo \
    && echo 'gpgkey=https://dl.google.com/linux/linux_signing_key.pub' >> /etc/yum.repos.d/google-chrome.repo \
    && yum install -y google-chrome

VOLUME [ "/root/.fonts" ]

EXPOSE 9222

ENTRYPOINT [ "google-chrome", \
    "--headless", \
    "--disable-gpu", \
    "--no-sandbox", \
    "--hide-scrollbars", \
    "--remote-debugging-address=0.0.0.0", \
    "--remote-debugging-port=9222" ]
