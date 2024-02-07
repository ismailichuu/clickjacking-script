#! /bin/bash
#variable
dom=$1
target=$dom
#greeting_message
greeting()
{
	echo -e "\e[1;36m welcome $USER \e[0m"
}
#creating_html_file
html_file()
{
	echo -e "\e[1;32m creating html file \e[0m"
}
html()
{
        echo "
                <html>
                <head>
                <title>Clickjack_vulnerbility</title>
                </head>
                <body>
                <p>If you can see the $target inside the box then it is vulnerable to clickjacking.</p>
                <iframe src="$target" width="500" height="500"></iframe>             
                </body>
                </html>
" > clickjack.html
}
#saving_file_and_opening
save()
{
	location=$(pwd)
	echo -e "\e[5;33m file saved in $location \e[0m"
	echo -e "\e[1;5;31m ctrl+C to exit \e[0m"
	firefox clickjack.html
}
#main_script
if [[ -z $dom ]]; then
	echo -e "\e[1;5;31m syntax error! \e[0m"
	echo -e "\e[1;32m give a URL \e[0m"
	echo -e "\e[1;4;32m example:$0 http://example.com\e[0m"
else
	greeting
    html_file
    html
    save

fi
