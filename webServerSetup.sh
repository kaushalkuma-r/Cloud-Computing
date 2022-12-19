sudo apt update
sudo apt install apache2
echo "We will use the highly restrictive profile ‘Apache’ to enable network ctivity on port 80."
sudo ufw allow 'Apache'
sudo systemctl status apache2
sudo systemctl start apache2
hostname -I
sudo mkdir -p /var/www/web1
sudo chown -R $USER:$USER /var/www/web1
sudo chmod -R 755 /var/www/web1
echo "ADD this code to html file OR add another html code to this file to display a page at the server"
echo "<html>"
echo "<head>"
echo "<title>Welcome to web1!</title>"
echo "</head>"
echo "<body>"
echo "<h1>You are running web1 on Ubuntu 22.04!</h1>"
echo "</body>"
echo "</html>"
sleep 15
nano /var/www/web1/index.html
echo "Add the code written below in the prompt that is going to be shown. You can replace info by any name that you want to give your server."
echo "<VirtualHost *:80>
      ServerName web1.example.com
      ServerAdmin webmaster@localhost
      DocumentRoot /var/www/web1
      ErrorLog ${APACHE_LOG_DIR}/error.log
      CustomLog ${APACHE_LOG_DIR}/access.log combined
      </VirtualHost>"
sleep 25
sudo nano /etc/apache2/sites-available/kaushal.conf

sudo a2ensite kaushal.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2
sudo apache2ctl configtest
echo "Add the servername of your domain in the following format."
echo "127.0.0.1 web1.example.com"
sleep 25
sudo nano /etc/hosts
sudo systemctl restart apache2




