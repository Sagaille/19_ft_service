FROM alpine:latest

# to access this ftps on filezilla or other in container mode only (not kubernetes),
# use ip with test:test

RUN apk update

RUN apk add bash vsftpd openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-subj "/C=BE/ST=Brussels/L=Brussels/O=ldavids/CN=example.com" \
-keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

RUN mkdir -p /home/test
# this line creates user "test" in dir /home/test and injects password + retype password
# echo -e is to enable interpretation of \n as enter/newline
RUN echo -e "test\ntest" | adduser -h /home/test test 2> /dev/null
RUN chown test:test /home/test
RUN mkdir /home/test/upload_folder
RUN chown test:test /home/test/upload_folder
RUN touch /home/test/upload_folder/text.txt
RUN echo "test_message" > /home/test/upload_folder/text.txt
RUN touch /etc/vsftpd.chroot_list && echo 'test:test' | chpasswd

ADD vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 20 21 21000-21005

CMD ["/usr/sbin/vsftpd","/etc/vsftpd/vsftpd.conf"]
