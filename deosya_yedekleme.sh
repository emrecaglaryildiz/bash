#! /bin/bash

#***Emre Caglar YILDIZ***092022***

#-----------------------------------------------------------------------
#Bulunulan yerdeki dosyalar tespit edilip yedek isimli klasore aliniyor.
#-----------------------------------------------------------------------

yedekdosyalar="./yedek-$(date +%d-%m-%Y-%H%M%S)"

if [ ! -d yedekklasor ]
then
  /bin/mkdir $yedekdosyalar
fi

for dosya in $(ls)
do
	if [ -f $dosya ]
	then
		echo "$dosya kopyalanıyor..."
		/bin/cp -p $dosya $yedekdosyalar
	fi
done

#------------------------------------------------------------------
#scp komutuyla alınan yedek dosyaları istenilen yere gönderiliyor. 
#------------------------------------------------------------------

scp -r $yedekdosyalar kullaniciadi@makine-ip:/dosyagonderilecekyol

echo "*-*-*-*-*-* İşlemler tamamlandı! *-*-*-*-*-*"
