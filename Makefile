all: notes slides

clean:
	cd doc; latexmk -C

edit:
	vim doc/UNIX.tex

upload:
	scp doc/notes.pdf sunfire.comp.nus.edu.sg:public_html/UWS
	scp doc/slides.pdf sunfire.comp.nus.edu.sg:public_html/UWS
	scp act/sms/SMSwords.txt sunfire.comp.nus.edu.sg:public_html/UWS
	scp video/intro.mpg sunfire.comp.nus.edu.sg:public_html/UWS

notes: doc/notes.pdf

slides: doc/slides.pdf

intro: video/intro.mpg

count: act/sms/count.txt

doc/notes.pdf: doc/UNIX.tex
	cd doc; latexmk -pdf notes.tex

doc/slides.pdf: doc/UNIX.tex
	cd doc; latexmk -pdf slides.tex

video/intro.mpg: video/unix.mp4
	cd video; mencoder unix.mp4 -ss 00:00:35 -endpos 00:00:19 \
					-of mpeg -mpegopts format=mpeg1 \
					-oac lavc -lavcopts acodec=mp2 \
					-ovc lavc -lavcopts vcodec=mpeg1video \
					-o intro.mpg

act/sms/SMSwords.txt: act/sms/SMS.txt
	cd act/sms; for i in `cat SMS.txt`; do echo $$i; done > SMSwords.txt

act/sms/count.txt: act/sms/SMSwords.txt
	cd act/sms; sort SMSwords.txt | uniq -c | sort -n > count.txt
